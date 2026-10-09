#!/usr/bin/env python3
"""Exercise the shipped Foundation implementation and ZIP writer."""
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile

PORT = Path(__file__).resolve().parents[1]

def run(args):
    subprocess.run([str(x) for x in args], check=True, capture_output=True)

with tempfile.TemporaryDirectory(prefix='icsm-diagnostics-') as tmp:
    base = Path(tmp)
    for name in ('zip', 'ioapi'):
        run(['xcrun', '-sdk', 'macosx', 'clang', '-c', PORT / f'vendor/minizip-1.3.1/{name}.c', '-o', base / f'{name}.o'])
    run(['xcrun', '-sdk', 'macosx', 'clang++', '-std=c++17', '-fobjc-arc', '-Wno-deprecated-declarations',
         PORT / 'distribution/test_diagnostics.mm', PORT / 'app/i5/diagnostics_export.mm',
         base / 'zip.o', base / 'ioapi.o', '-framework', 'Foundation', '-lz', '-o', base / 'test'])
    documents = base / 'Documents'; evidence = documents / 'I5'; evidence.mkdir(parents=True)
    console = documents / 'runtime-i5/csgo/i5_console.log'; console.parent.mkdir(parents=True)
    (evidence / 'client.log').write_text('previous crash marker\npassword "secret-previous"\n')
    console.write_text('previous console marker\n')
    (evidence / 'status.json').write_text(json.dumps({'pid':11,'video_state':{'width':1920},'network':{'password':'secret-status'},'touch':{'name':'private-user'}}))

    def action(name):
        run([base / 'test', documents, name, base / 'result.txt'])
    def archive():
        action('export'); path = Path((base / 'result.txt').read_text())
        with zipfile.ZipFile(path) as z:
            assert z.testzip() is None
            return {n:z.read(n) for n in z.namelist()}

    action('begin')
    assert 'previous crash marker' in (evidence / 'previous-client.log').read_text()
    assert not (evidence / 'client.log').exists()
    action('error')
    startup = archive()  # Export works before the game has started.
    error = json.loads(startup['startup-error.json'])['error']
    assert error['underlying']['domain']=='MTLLibraryErrorDomain' and error['underlying']['code']==3
    assert error['shader_file']=='shader-cache/fixture.metallib'
    assert error['import_details']['phase']=='load_metal_library' and error['import_details']['archive_bytes']==128
    (evidence / 'import-diagnostics.json').write_text(json.dumps({'result':'failed','phase':'extract_file','current_file':'game-assets/csgo/fixture.txt','operation':{'reason':'sha256_mismatch'}}))
    assert b'secret-previous' not in b''.join(startup.values())
    (evidence / 'command.json').write_text('{"command":"password secret-mailbox"}')
    (console.parent / 'cfg').mkdir(); (console.parent / 'cfg/config.cfg').write_text('name "private-user"')
    (evidence / 'client.log').write_bytes(b'A\n' * (3*1024*1024//2) + b'final crash marker\npassword \\"secret-current\\"; connect host\n')
    console.write_bytes(b'non-UTF8: \xff\xfe\n"rcon_password" "secret-console"\n')
    action('system')
    live = archive(); data = b''.join(live.values())
    assert json.loads(live['import-diagnostics.json'])['operation']['reason']=='sha256_mismatch'
    assert b'final crash marker' in live['client.log'] and len(live['client.log'])<=2*1024*1024
    assert b'secret-' not in data and b'private-user' not in data
    assert 'command.json' not in live and not any('config.cfg' in n for n in live)
    assert any(n.startswith('system-reports/') for n in live)
    assert json.loads(live['previous-status.json'])=={'pid':11,'video_state':{'width':1920}}
    action('begin')
    assert b'previous crash marker' in (evidence / 'older-client.log').read_bytes()
    assert (evidence / 'previous-import-diagnostics.json').exists()
    action('begin')
    (evidence / 'client.log').symlink_to(base / 'result.txt')
    final = archive(); assert 'client.log' not in final
    archive(); assert len(list((documents / 'Diagnostics').glob('*.zip')))==3
    assert not list((documents / 'Diagnostics').glob('*.partial'))
    print('PASS: pre-launch export, previous-session retention, NSError chain, log tails, credential filtering, non-UTF8 logs, status whitelist, MetricKit payload, symlink rejection, ZIP CRC and bounded archive retention.')
