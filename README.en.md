# iCSM

[简体中文](https://github.com/zktfjcksxk-spec/iCSM#chinese) | [English](https://github.com/zktfjcksxk-spec/iCSM#english)

A personal CSGO port by **BILIBILI @SU_ZeShin** for **iPhone and iPad**, running natively on **ARM64** with a **Metal rendering backend**. The game modules, SDL, and Metal backend are built from source. Current version: **0.7.2 (Build 86)**.

## Features added in this port

- **MetalFX spatial upscaling**: render the scene at a lower internal resolution and upscale it to the output resolution, with an adjustable scene render scale.
- **MetalFX frame interpolation**: targets **60 rendered frames → 120 displayed frames**, with low-latency scheduling, weapon animation protection, and adaptive behavior under load. Requires a supported GPU and a 120 Hz display; actual frame rates depend on the device and scene.
- **Independent skin quality**: separate controls for weapon and knife skin lighting detail and texture resolution, allowing detailed skins alongside lower scene settings.
- **Touch controls**: swipe on the left half to move and on the right half to look, with fixed camera sensitivity and no acceleration. Button positions and sizes are editable, including four-finger layouts, inspect, and drop.
- **Offline inventory and mobile settings**: weapon, knife, and skin selection; skin previews; player renaming with the system keyboard; screen size adaptation; 60/90/120 FPS limits; and connections to self-hosted private servers.

## Build and install

Requires **macOS, Xcode with the iPhoneOS 27.x SDK, and Python 3**. The device must run **iOS / iPadOS 27.0 or later**. Sign in to your own Apple account in **Xcode → Settings → Accounts**, connect and unlock your device, and enable Developer Mode.

Clone the repository and run the following from its root directory:

```sh
git clone https://github.com/zktfjcksxk-spec/iCSM.git
cd iCSM
./icsm doctor
./icsm setup --team YOUR_TEAM_ID --bundle-id com.yourname.icsm --device YOUR_DEVICE_ID
./icsm build --jobs 6
./icsm install
./icsm launch
```

Replace the Team ID, Bundle ID, and device ID with your own values. Use `./icsm doctor` to find the device ID. The first build installs pinned versions of CMake and Ninja, compiles the native modules and app, and signs the app with your own certificate. The resulting IPA is **`Build/iCSM.ipa`**.

## Game data and first launch

**Download the game data: [iCSM-Data.zip (iCloud)](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)**. Keep the exact filename `iCSM-Data.zip`; do not extract it.

The app and game data are distributed separately. After installing the app, transfer **`iCSM-Data.zip`** to the app's file-sharing directory:

- **macOS**: Finder → your device → Files → iCSM.
- **Windows**: Apple Devices → your device → Files → iCSM → Add File.

Wait for the transfer to finish, then tap **“检查并导入” (Check and Import)** in the app. Allow at least **35 GB of free space** for the initial import. The first launch prepares and validates Metal shaders before opening the main menu. A mobile graphics preset is applied on a fresh installation; players can change it in the graphics settings.

See the **[complete build, signing, and data import guide](docs/BUILD.en.md)**. Tested devices: **iPhone 17 Pro Max and M5 iPad Pro**.

## Project notes

This is a personal port. **Commercial use is prohibited.** CSGO, the Source engine, and third-party dependencies remain subject to their respective rights and licenses. Existing dependency license texts are preserved. The separate app/data installation workflow references [brolnickij/emu](https://github.com/brolnickij/emu).
