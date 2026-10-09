<a name="english"></a>

# iCSM

English | [简体中文](#chinese)

A personal CSGO port by **BILIBILI @SU_ZeShin** for **iPhone and iPad**, running natively on **ARM64** with a **Metal rendering backend**. The game modules, SDL, and Metal backend are built from source. Current version: **0.7.2 (Build 149)**.

## Features added in this port

- **MetalFX spatial upscaling**: render the scene at a lower internal resolution and upscale it to the output resolution, using the scene render scale defined by the graphics presets.
- **MetalFX frame interpolation**: targets **60 rendered frames → 120 displayed frames**, with low-latency scheduling, weapon animation protection, and adaptive behavior under load. Requires a supported GPU and a 120 Hz display; actual frame rates depend on the device and scene.
- **Independent skin quality**: separate controls for weapon and knife skin lighting detail and texture resolution, allowing detailed skins alongside lower scene settings.
- **Touch controls**: swipe on the left half to move and on the right half to look, with fixed camera sensitivity and no acceleration. Button positions and sizes are editable, including four-finger layouts, inspect, and drop.
- **Data import and diagnostics**: import a matching ZIP directly through the system file picker, with per-file SHA-256 / ZIP CRC validation and exportable startup/import diagnostics.
- **Mobile interface and graphics presets**: frosted menu panels, swipeable map selection and settings, inventory filtering and long-press equipment selection; four managed scene-quality presets, with FPS, frame interpolation, motion blur and weapon quality remaining separately selectable.
- **Offline inventory and mobile settings**: weapon, knife, and skin selection; skin previews; player renaming with the system keyboard; screen size adaptation; 60/90/120 FPS limits; and connections to self-hosted private servers.

See the [Build 149 update notes](docs/UPDATES.md#english) for the changes since the previous GitHub version.

## Build and install

**Windows / cloud builds:** follow the [cloud build and Windows installation guide](docs/CLOUD_BUILD.en.md) to build an IPA in GitHub Actions, then sign it with your own Apple account. The commands below are for local Mac builds.

Requires **macOS, Xcode with the iPhoneOS 27.x SDK, and Python 3**. The device must run **iOS / iPadOS 27.0 or later**. Sign in to your own Apple account in **Xcode → Settings → Accounts**, connect and unlock your device, and enable Developer Mode.

From the extracted source kit or cloned repository, run the build commands in its root directory:

```sh
./icsm doctor
./icsm setup --team YOUR_TEAM_ID --bundle-id com.yourname.icsm --device YOUR_DEVICE_ID
./icsm build --jobs 6
./icsm install
./icsm launch
```

Replace the Team ID, Bundle ID, and device ID with your own values. Use `./icsm doctor` to find the device ID. The first build installs pinned versions of CMake and Ninja, compiles the native modules and app, and signs the app with your own certificate. The resulting IPA is **`Build/iCSM.ipa`**.

## Game data and first launch

**Download the game data: [iCSM-v1.zip (iCloud)](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)**. Do not extract it. File-sharing imports require the filename `iCSM-v1.zip`; the file picker also accepts renamed copies of the matching package.

The app and game data are distributed separately. On the initial screen, tap **“选择数据包 ZIP” (Select Data ZIP)** and select the downloaded package from Files (On My iPhone / iPad or iCloud Drive). No extraction or manual move into the app directory is needed; this method preserves the original ZIP. Failed imports can be diagnosed with **“导出报错日志” (Export Error Logs)** at the top right.

Alternatively, transfer **`iCSM-v1.zip`** to the app's file-sharing directory:

- **macOS**: Finder → your device → Files → iCSM.
- **Windows**: Apple Devices → your device → Files → iCSM → Add File.

Wait for the transfer to finish, then tap **“检查并导入” (Check and Import)** in the app. Allow at least **35 GB of free space** for the initial import. The first launch prepares and validates Metal shaders before opening the main menu. A mobile graphics preset is applied on a fresh installation; players can change it in the graphics settings.

See the **[complete build, signing, and data import guide](docs/BUILD.en.md)**. Tested devices: **iPhone 17 Pro Max and M5 iPad Pro**.

## Project notes

This is a personal port. **Commercial use is prohibited.** CSGO, the Source engine, and third-party dependencies remain subject to their respective rights and licenses. Existing dependency license texts are preserved. The separate app/data installation workflow references [brolnickij/emu](https://github.com/brolnickij/emu).

---

<a name="chinese"></a>

# iCSM · 简体中文

[English](#english) | 简体中文

由 **BILIBILI @SU_ZeShin** 个人移植的 CSGO 移动版，面向 **iPhone / iPad**，以 ARM64 原生运行并使用 Metal 渲染后端。游戏模块、SDL 和 Metal 后端均由源码构建。当前版本：**0.7.2（Build 149）**。

## 本移植新增功能

- **MetalFX 空间超分**：以较低内部分辨率渲染场景，再超分至输出分辨率，场景渲染比例由画质预设管理。
- **MetalFX 插帧**：支持以 **60 帧真实渲染 → 120 帧显示** 为目标的插帧，加入低延迟调度、武器动画保护和负载自适应。需要支持该功能的 GPU 与 120 Hz 屏幕，实际帧率取决于设备和场景。
- **皮肤画质独立调整**：枪械和刀具的光影细节、皮肤贴图精度分别设置，可在降低场景画质时保留皮肤质感。
- **移动触屏适配**：左半屏滑动移动、右半屏滑动视角，固定视角灵敏度；可编辑按钮位置与大小，并支持四指布局、检视和丢弃。
- **数据导入与诊断**：通过系统文件选择器直接导入配套 ZIP，逐个校验 SHA-256 / ZIP CRC，初始页可导出启动和导入报错日志。
- **移动界面与画质预设**：毛玻璃菜单、可滑动选图和设置、库存分类与长按装备；四档预设统一管理场景画质，帧率、插帧、动态模糊和武器画质仍可单独设置。
- **离线库存与移动设置**：枪械／刀具及皮肤选择、皮肤预览、系统键盘改名、屏幕尺寸适配、60／90／120 帧限制，以及自建私人服务器连接。

本次相较旧版 GitHub 源码的变化见 [Build 149 更新说明](docs/UPDATES.md#chinese)。

## 编译与安装

**Windows / 云编译：** 按[云编译与 Windows 安装指南](docs/CLOUD_BUILD.md)，在 GitHub Actions 生成 IPA，再用自己的 Apple 账户签名安装。下方命令用于 Mac 本机编译。

需要 **macOS、Xcode（iPhoneOS 27.x SDK）、Python 3**，设备系统至少为 **iOS / iPadOS 27.0**。先在 Xcode → Settings → Accounts 登录自己的 Apple 账户，连接并解锁设备，开启开发者模式。

解压源码包或下载本仓库，在源码根目录运行编译命令：

```sh
./icsm doctor
./icsm setup --team YOUR_TEAM_ID --bundle-id com.yourname.icsm --device YOUR_DEVICE_ID
./icsm build --jobs 6
./icsm install
./icsm launch
```

将 Team ID、Bundle ID 和设备 ID 替换为自己的信息；设备 ID 可用 `./icsm doctor` 查看。首次构建会安装固定版本的 CMake / Ninja，然后编译原生模块、构建应用并使用自己的证书签名。最终 IPA 位于 **`Build/iCSM.ipa`**。

## 导入数据与首次启动

**数据包下载：[iCSM-v1.zip（iCloud）](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)**。无需解压。电脑文件共享导入须保留文件名 `iCSM-v1.zip`；系统文件选择器也接受改名后的配套数据包。

应用与游戏数据分开提供。初始页点击左上角 **“选择数据包 ZIP”**，从系统“文件”的“我的 iPhone / iPad”或 iCloud Drive 选择已下载的数据包，无需解压或手动搬入应用目录，此方式保留原 ZIP。导入失败时，可直接点击右上角 **“导出报错日志”** 查看原因。

也可将配套 **`iCSM-v1.zip`** 导入 iCSM 的文件共享目录：

- **macOS**：Finder → 设备 → 文件 → iCSM。
- **Windows**：Apple Devices → 设备 → 文件 → iCSM → 添加文件。

等待传输完成，在游戏中点击“检查并导入”。首次导入建议至少预留 **35 GB** 空间；首次启动会准备并验证 Metal 着色器，再进入大厅。默认使用已调好的移动画质，玩家可在画面设置中自行修改。

完整说明见 **[编译、签名与数据导入指南](docs/BUILD.md)**。当前实测设备为 **iPhone 17 Pro Max、M5 iPad Pro**。

## 项目说明

个人移植，**严禁商业用途**。CSGO、Source 引擎及第三方依赖的版权和许可归各自权利人所有，保留依赖原有许可文本。安装与数据分离流程参考 [brolnickij/emu](https://github.com/brolnickij/emu)。
