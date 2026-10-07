# iCSM: Building, signing, and importing game data

[简体中文](BUILD.md) | English

This source kit targets iPhone and iPad. The native Source game modules, SDL, and Metal backend are compiled locally from source. It does not include precompiled game frameworks, the author's signing credentials, account settings, or device configuration. Third-party static dependencies such as V8 and font/video libraries, along with generated protocol headers, are provided. Maps, materials, skin previews, and offline shader libraries are supplied separately in `iCSM-Data.zip`.

## 1. Build and install on a Mac

Requirements: macOS, Xcode with the iPhoneOS 27.x SDK, Python 3, and an internet connection for the first installation of pinned CMake and Ninja versions. The minimum device OS is iOS / iPadOS 27.0. Windows can transfer game data; it cannot run the Xcode build.

Sign in to your own Apple account in **Xcode → Settings → Accounts**. Connect and unlock the device, and enable Developer Mode. Open a terminal at the repository root, where the `icsm` script is located:

```sh
./icsm doctor
./icsm setup --team YOUR_TEAM_ID --bundle-id com.yourname.icsm --device YOUR_DEVICE_ID
./icsm build
./icsm install
```

Replace the placeholders with your own Team ID, a unique Bundle ID, and your device ID. `./icsm doctor` lists the connected devices. After installation, you can start the app with `./icsm launch`.

The build compiles the native engine, Metal/SDL modules, and app, then signs the app with your certificate and exports `Build/iCSM.ipa`. Use `./icsm modules` to rebuild the native modules or `./icsm app` to rebuild only the app. A full source build takes time and requires substantial disk space. For updates, keep the same Team ID and Bundle ID and install over the existing app. Uninstalling removes its game data, inventory, settings, and touch layout.

The app's signing intermediates are stored in `~/Library/Caches/iCSM-build/` to avoid Finder metadata added by iCloud-synced Documents/Desktop folders. Native module outputs and the final IPA remain in the kit's `Build/` directory.

The IPA contains ARM64 iOS modules and does not depend on Rosetta or runtime CPU translation. Free Apple account provisioning commonly expires after seven days and requires signing and installing again; follow the actual limits reported by Xcode and the device. If the device asks you to trust the developer certificate, complete that step in Settings.

## 2. Import data from macOS or Windows

**Game data download: [iCSM-Data.zip (iCloud)](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)**.

You can open the installed app before importing data; it will show the import instructions. Keep the filename exactly `iCSM-Data.zip`. Do not extract the archive on your computer.

- **Mac**: Finder → connected device → Files → iCSM. Drag `iCSM-Data.zip` into iCSM.
- **Windows**: Apple Devices → connected device → Files → iCSM → Add File. Select `iCSM-Data.zip`.

Leave the app on its import screen while copying. **Wait for the computer to confirm that the transfer has finished**, then tap **“检查并导入” (Check and Import)** in the app. Do not replace game data during a match. Alternatively, use the iOS Files app to place the archive in **On My iPhone / iPad → iCSM**.

The extracted data occupies approximately **19.65 GB**. The initial import temporarily needs space for both the archive and extracted files, plus caches; allow at least **35 GB of free space** before transferring. The app checks the available space. It validates files using SHA-256, ZIP CRC, and path checks before committing them individually. If import fails or is interrupted, the app displays the reason and retains already verified files for the next attempt. Use the data pack that matches this release's resource manifest.

After a successful import, the app deletes the imported ZIP automatically. **Do not delete `game-assets` or `runtime-i5`.** The `runtime-i5` folder visible through file sharing holds personal configuration and saved data and does not need to be imported again.

Apple's file-sharing instructions: [Finder on Mac](https://support.apple.com/en-us/119585) and [Apple Devices on Windows](https://support.apple.com/en-us/120402). The separate app/data workflow and import recovery design reference [brolnickij/emu](https://github.com/brolnickij/emu).

## 3. First launch and settings

Startup proceeds through resource validation/import, initial Metal shader preparation, and loading the main menu. The data pack contains **7,906 offline-compiled iOS Metal shader libraries**. The app loads and validates them on the device during the initial preparation and reuses its persistent records afterward. If the system purges temporary caches, they can be restored from the imported data without downloading the entire pack again.

Shader libraries and render pipelines are different. New combinations of maps, materials, and skins may still create pipelines on first use. The app retains its device-specific pipeline caching and recording mechanisms. GPU pipeline binaries are not copied between different device models, and first-use compilation may still occur.

A fresh installation applies the author's current iPhone graphics preset: 1920×1080 output, 60 FPS base rendering, frame interpolation and MetalFX spatial upscaling enabled, a 60.384754% scene render scale, low model/effect detail, medium texture detail, low shadows, 2× texture filtering, and anti-aliasing, VSync, and motion blur disabled. Skin lighting and skin texture detail default to high. Players can change the settings in the game; restarting or updating does not repeatedly overwrite them. Fullscreen remains enforced.

The player avatar uses the original CSGO default icon, and the initial name is **“玩家” (Player)**. Tap the name or **“修改昵称” (Change Name)** at the top of the main menu to open the system keyboard, then choose **“保存” (Save)**. The name persists across restarts and updates. Chinese names are supported; names must be nonempty and no longer than 127 UTF-8 bytes. The old fixed author name is migrated to “玩家” during an update.

Tested devices are **iPhone 17 Pro Max and M5 iPad Pro**. Other models have not undergone full compatibility, memory-use, or frame-rate testing. 120 Hz output, frame interpolation support, and performance depend on the actual device.

## 4. Local files and privacy

`config.local.json`, `Build/`, and signed IPAs are local build products and should not be included in the public source kit. The app does not request your Apple account password or download game assets from the internet. The importer uses a fixed resource allowlist and does not overwrite inventory, touch layouts, or player names. Uninstalling removes the app's entire data container; back it up first.

Third-party copyright and license texts are retained. The resource pack contains the game assets and modifications used by this project; their use and distribution remain subject to the rights applicable to those resources.

Return to the [English project overview](../README.en.md).
