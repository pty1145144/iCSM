#!/usr/bin/env python3
"""Exercise real ZIP64 extraction, receipts, Metal load, corruption and recovery."""
import hashlib
import json
from pathlib import Path
import shutil
import struct
import subprocess
import tempfile
import zipfile

PORT = Path(__file__).resolve().parents[1]
HERE = Path(__file__).resolve().parent


def run(args, **kwargs):
    return subprocess.run([str(x) for x in args], check=True, **kwargs)


def main():
    with tempfile.TemporaryDirectory(prefix='icsm-installer-test-') as temporary:
        base = Path(temporary)
        (base / 'shader.metal').write_text('#include <metal_stdlib>\nusing namespace metal;\nkernel void fixture(device float *x [[buffer(0)]], uint id [[thread_position_in_grid]]) { x[id]=1; }\n')
        run(['xcrun', '-sdk', 'macosx', 'metal', '-c', base / 'shader.metal', '-o', base / 'shader.air'])
        run(['xcrun', '-sdk', 'macosx', 'metallib', base / 'shader.air', '-o', base / 'shader.metallib'])
        run(['xcrun', '-sdk', 'macosx', 'clang', '-c', PORT / 'vendor/minizip-1.3.1/unzip.c', '-o', base / 'unzip.o'])
        run(['xcrun', '-sdk', 'macosx', 'clang', '-c', PORT / 'vendor/minizip-1.3.1/ioapi.c', '-o', base / 'ioapi.o'])
        run(['xcrun', '-sdk', 'macosx', 'clang++', '-std=c++17', '-fobjc-arc', '-Wno-deprecated-declarations',
             HERE / 'test_installer.mm', PORT / 'app/i5/data_install.mm', base / 'unzip.o', base / 'ioapi.o',
             '-framework', 'Foundation', '-framework', 'Metal', '-lz', '-o', base / 'test'])
        values = {'game-assets/csgo/fixture.txt': b'iCSM fixture\n' * 50000,
                  'game-assets/csgo/empty.txt': b'',
                  'shader-cache/fixture.metallib': (base / 'shader.metallib').read_bytes()}
        files = [{'path': p, 'size': len(v), 'sha256': hashlib.sha256(v).hexdigest()} for p, v in values.items()]
        manifest = {'version': 1, 'identity': hashlib.sha256(json.dumps(files).encode()).hexdigest(), 'files': files}
        manifest_path = base / 'manifest.json';manifest_path.write_text(json.dumps(manifest))

        def package(folder, changes=None, extra=None, filename='iCSM-Data.zip'):
            folder.mkdir(exist_ok=True)
            with zipfile.ZipFile(folder / filename, 'w', zipfile.ZIP_DEFLATED) as archive:
                for p, v in dict(values, **(changes or {})).items():
                    with archive.open(p, 'w', force_zip64=True) as f:
                        f.write(v)
                if extra:
                    archive.writestr(extra, 'bad')

        def check(folder, ok, text=None, selected=None):
            args=[str(base / 'test'), str(folder), str(manifest_path)]
            if selected:args.append(str(selected))
            r = subprocess.run(args, text=True, capture_output=True)
            if (r.returncode == 0) != ok or (text and text not in r.stdout):
                raise AssertionError(str(r.returncode) + "\n" + r.stdout + r.stderr)
            return r.stdout

        def diagnosis(folder, phase, reason=None, filename=None):
            record=json.loads((folder / 'I5/import-diagnostics.json').read_text())
            assert record['result']=='failed' and record['phase']==phase, record
            if reason:assert record['operation']['reason']==reason, record
            if filename:assert record['current_file']==filename, record
            return record

        install = base / 'valid';package(install)
        print(check(install, True))
        assert not (install / 'iCSM-Data.zip').exists()
        assert (install / 'game-assets/csgo/fixture.txt').read_bytes() == values['game-assets/csgo/fixture.txt']
        assert json.loads((install / 'I5/import-diagnostics.json').read_text())['result']=='ready'
        release = base / 'release-v1';package(release,filename='iCSM-v1.zip');check(release,True)
        assert not (release / 'iCSM-v1.zip').exists()
        # Picker URLs can live outside Documents and retain any download name.
        # The source is borrowed: never delete it, even when inside Documents.
        provider=base / 'file-provider';package(provider,filename='iCSM-v1 (1).zip')
        selected=provider / 'iCSM-v1 (1).zip';before=selected.read_bytes()
        picked=base / 'picked';check(picked,True,selected=selected)
        assert selected.read_bytes()==before and not (picked / 'iCSM-v1.zip').exists()
        assert (picked / 'game-assets/csgo/fixture.txt').read_bytes()==values['game-assets/csgo/fixture.txt']
        record=json.loads((picked / 'I5/import-diagnostics.json').read_text())
        assert record['archive_source']=='document_picker' and record['archive_name']==selected.name
        same=base / 'same-folder';package(same,filename='iCSM-v1.zip')
        check(same,True,selected=same / 'iCSM-v1.zip');assert (same / 'iCSM-v1.zip').exists()
        # Failed provider reads must not silently start from existing assets.
        check(picked,False,selected=provider / 'missing.zip')
        failure=json.loads((picked / 'I5/import-diagnostics.json').read_text())
        assert failure['phase'] in ('coordinate_selected_archive','open_selected_archive')
        bad_provider=base / 'bad-provider';package(bad_provider,extra='../escape')
        check(base / 'picked-invalid',False,'不匹配',selected=bad_provider / 'iCSM-Data.zip')
        assert (bad_provider / 'iCSM-Data.zip').exists()
        # Cache can be purged by iOS. Immutable shaders must restore it without a package.
        shutil.rmtree(install / 'cache');check(install, True, '正在准备 Metal 着色器')
        assert (install / 'cache/fixture.metallib').exists()
        check(install, True)
        # A same-sized mutation invalidates the stamp/hash rather than trusting file size.
        (install / 'game-assets/csgo/fixture.txt').write_bytes(b'x' * len(values['game-assets/csgo/fixture.txt']))
        check(install, False, '缺少');diagnosis(install,'locate_data_package','package_missing');package(install);check(install, True)
        for index, path in enumerate(['../escape', '/absolute', 'game-assets/../escape', 'unlisted']):
            bad = base / f'path-{index}';package(bad, extra=path);check(bad, False, '不匹配')
            diagnosis(bad,'validate_zip_directory','invalid_zip_path' if index<3 else 'unexpected_zip_entry',path)
            assert not (bad / 'game-assets/csgo/fixture.txt').exists()
        bad = base / 'hash';package(bad, changes={'game-assets/csgo/fixture.txt': b'z' * len(values['game-assets/csgo/fixture.txt'])})
        check(bad, False, '校验失败');assert not (bad / 'game-assets/csgo/fixture.txt').exists()
        mismatch=diagnosis(bad,'extract_file','sha256_mismatch','game-assets/csgo/fixture.txt')
        assert mismatch['operation']['actual_sha256']!=mismatch['operation']['expected_sha256']
        truncated = base / 'truncated';package(truncated)
        zip_path = truncated / 'iCSM-Data.zip';zip_path.write_bytes(zip_path.read_bytes()[:-80])
        check(truncated, False, '未复制完成')
        diagnosis(truncated,'open_zip','zip_open_failed')
        link = base / 'symlink';package(link);(link / 'game-assets').symlink_to(base / 'valid/game-assets', target_is_directory=True)
        check(link, False, '符号链接')
        diagnosis(link,'verify_existing_files')
        wrong_name=base / 'wrong-name';package(wrong_name,filename='iCSM-v1 (1).zip');check(wrong_name,False,'缺少')
        wrong=diagnosis(wrong_name,'locate_data_package','package_missing')
        assert not wrong['archive_exists'] and wrong['zip_files_in_documents'][0]['filename']=='iCSM-v1 (1).zip'
        directory_error=base / 'directory-error';directory_error.mkdir();(directory_error / 'cache').write_text('blocked directory')
        check(directory_error,False);diagnosis(directory_error,'create_directories')
        receipt_error=base / 'receipt-error';package(receipt_error);(receipt_error / 'receipts.json').mkdir()
        check(receipt_error,False);diagnosis(receipt_error,'write_receipts')
        crc_error=base / 'crc-error';crc_error.mkdir()
        crc_path=crc_error / 'iCSM-v1.zip'
        with zipfile.ZipFile(crc_path,'w',compression=zipfile.ZIP_STORED) as z:
            for p,v in values.items():z.writestr(p,v)
        with zipfile.ZipFile(crc_path) as z:info=z.getinfo('game-assets/csgo/fixture.txt');offset=info.header_offset
        data=bytearray(crc_path.read_bytes());name_len,extra_len=struct.unpack_from('<HH',data,offset+26)
        data[offset+30+name_len+extra_len]^=1;crc_path.write_bytes(data)
        check(crc_error,False,'校验失败');diagnosis(crc_error,'extract_file','zip_crc_mismatch','game-assets/csgo/fixture.txt')
        # A ZIP64 directory declares a size larger than the real free space.
        # Rejection must happen before reading or allocating its file contents.
        space=base / 'space';space.mkdir();name=b'game-assets/csgo/huge.txt';size=1<<50
        local_extra=struct.pack('<HHQQ',1,16,size,0);central_extra=struct.pack('<HHQ',1,8,size)
        local=struct.pack('<4s5H3I2H',b'PK\x03\x04',45,0,0,0,0,0,0,0xffffffff,len(name),len(local_extra))+name+local_extra
        central=struct.pack('<4s6H3I5H2I',b'PK\x01\x02',45,45,0,0,0,0,0,0,0xffffffff,len(name),len(central_extra),0,0,0,0,0)+name+central_extra
        end=struct.pack('<4s4H2IH',b'PK\x05\x06',0,0,1,1,len(central),len(local),0)
        (space / 'iCSM-v1.zip').write_bytes(local+central+end)
        space_manifest={'version':1,'identity':'space-fixture','files':[{'path':name.decode(),'size':size,'sha256':'0'*64}]}
        manifest_path.write_text(json.dumps(space_manifest));check(space,False,'剩余空间不足')
        d=diagnosis(space,'check_free_space','insufficient_free_space');assert d['free_bytes']<d['required_free_bytes'] and d['required_free_bytes']==size+512*1024*1024
        manifest_path.write_text(json.dumps(manifest))
        # A correctly hashed but incompatible Metal file reaches the actual
        # library loader; its underlying NSError and filename must survive.
        incompatible = base / 'incompatible';bad_values=dict(values)
        bad_values['shader-cache/fixture.metallib']=b'not-a-metal-library'
        bad_manifest=dict(manifest,files=[{'path':p,'size':len(v),'sha256':hashlib.sha256(v).hexdigest()} for p,v in bad_values.items()])
        incompatible.mkdir()
        with zipfile.ZipFile(incompatible / 'iCSM-Data.zip','w') as z:
            for p,v in bad_values.items():z.writestr(p,v)
        manifest_path.write_text(json.dumps(bad_manifest))
        report=check(incompatible,False,'着色器无法在当前系统加载')
        assert 'domain=iCSM.Data code=2 shader=shader-cache/fixture.metallib underlying=MTLLibraryErrorDomain' in report
        diagnosis(incompatible,'load_metal_library',filename='shader-cache/fixture.metallib')
        print('PASS: external picker URL import, source preservation, provider failure, ZIP64 import and recovery; diagnostic stages/files for missing or misnamed packages, path rejection, SHA-256 mismatch, CRC mismatch, truncation, directory/receipt I/O errors, insufficient space and Metal library incompatibility.')


if __name__ == '__main__':
    main()
