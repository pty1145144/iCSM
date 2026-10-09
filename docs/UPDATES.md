<a name="english"></a>

# Build 149 · October 9, 2026

English | [简体中文](#chinese)

This update brings the iPhone / iPad source snapshot from Build 86 to **0.7.2 (Build 149)**. Local and GitHub Actions builds use the updated native build graph: **3,848 tasks and 35 frameworks**.

- The initial screen can select a matching data ZIP from Files or iCloud Drive. It validates the package, preserves the selected ZIP, and can export import diagnostics before the game starts. File sharing remains available.
- Diagnostics export includes application and import failures. The installer reports missing files, incomplete ZIPs, content mismatches, storage errors and Metal library loading failures.
- The mobile interface now includes frosted menu surfaces, swipeable map selection and settings, a native console with keyboard input, room search, and an FPS toggle.
- Inventory uses category filters and long-press equipment selection. Shared guns use the same skin for both teams; exclusive guns respect their team. The knife category has separate police and terrorist columns, each with the full knife selection. Skin previews and the two Printstream finishes are included.
- Four graphics presets manage scene rendering. The medium preset uses the measured iPhone profile with aspect-ratio adaptation and approximately 1.7 million scene pixels. Map-material, shadow-submission, sampler, buffer-pool and shader/pipeline-cache changes are included. Weapon and skin lighting and texture detail remain independently selectable and default to the highest setting.
- MetalFX spatial upscaling and 60→120 frame interpolation remain available on supported devices. FPS, frame interpolation, motion blur and weapon quality are separate controls; frame rates depend on the device and scene.
- The app icon, loading progress view and startup announcement are updated. A fresh installation uses the player name `icsmer`, which can be changed with the system keyboard.

The minimum OS remains **iOS / iPadOS 27.0**, and the build requires the **iPhoneOS 27.x SDK**. This update does not add support for iOS 26. Game data remain a separate [iCloud download](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA); the repository contains the mobile build inputs and app resources, without the full map/model/texture package or personal signing configuration.

Build instructions: [Mac](BUILD.en.md) · [Windows / GitHub Actions](CLOUD_BUILD.en.md).

[The complete Build 149 cloud build](https://github.com/zktfjcksxk-spec/iCSM/actions/runs/37881597437) passed. The downloaded IPA also passed independent integrity, dependency and signature verification; see the [validation record](validation/build-149.json). The cloud artifact requires personal re-signing and has not been device-tested.

---

<a name="chinese"></a>

# Build 149 · 2026 年 10 月 9 日

[English](#english) | 简体中文

本次将 iPhone / iPad 源码从 Build 86 同步至 **0.7.2（Build 149）**。本机及 GitHub Actions 使用更新后的原生构建清单：**3,848 项任务、35 个框架**。

- 初始页可从系统“文件”或 iCloud Drive 选择配套数据包 ZIP，校验内容并保留原 ZIP；游戏尚未启动时也能导出导入诊断。电脑文件共享导入继续可用。
- 日志导出覆盖应用与导入异常；导入器记录缺失文件、ZIP 未传完、内容不匹配、存储异常和 Metal 着色器库加载失败等原因。
- 移动界面加入毛玻璃菜单、可滑动选图及设置、支持系统键盘的原生控制台、搜索房间和 FPS 开关。
- 库存支持分类筛选和长按装备；双方共用枪械统一皮肤，专属枪械遵守阵营限制。刀具页左右分为警／匪，各自包含全部刀具；包含皮肤预览及两款印花集。
- 四档预设统一管理场景画质，中档采用 iPhone 实测方案，按屏幕比例适配约 170 万场景像素；同步地图材质、阴影提交、采样器、缓冲池和着色器／管线缓存优化。武器／皮肤光影与贴图仍可单独设置，默认最高。
- 支持设备继续提供 MetalFX 空间超分和 60→120 插帧。帧率、插帧、动态模糊、武器画质可独立选择，实际帧率取决于设备及场景。
- 更新应用图标、加载进度界面和启动公告。全新安装默认昵称为 `icsmer`，可通过系统键盘改名。

最低系统仍为 **iOS / iPadOS 27.0**，编译需要 **iPhoneOS 27.x SDK**；本次没有加入 iOS 26 支持。游戏数据仍通过独立的 [iCloud 链接](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)提供。仓库包含移动端编译输入及应用资源，不包含完整地图／模型／贴图数据包和个人签名配置。

编译说明：[Mac](BUILD.md) · [Windows / GitHub Actions](CLOUD_BUILD.md)。

[Build 149 完整云编译](https://github.com/zktfjcksxk-spec/iCSM/actions/runs/37881597437)已通过，下载的 IPA 也通过独立完整性、依赖和签名检查，详见[验收记录](validation/build-149.json)。云端产物仍需个人签名，未进行设备测试。
