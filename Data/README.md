# Mobile data build inputs

English | [简体中文](#简体中文)

The **Build iCSM IPA + Data** workflow generates a paired unsigned IPA and data ZIP using GitHub-hosted inputs, without downloading from iCloud. See the [full build guide](../docs/DATA_BUILD.md).

- `shaders/`: **7,906 actual Source-adapted MSL source files**, preserved byte-for-byte. Each filename is the SHA-256 of the complete source, matching the native renderer's cache key.
- `shaders.json`: source keys, target `air64-apple-ios27.0`, and the existing options `-std=metal3.2` / `-fno-fast-math`.
- `resources.json`: paths, sizes and SHA-256 hashes for **4,792 resources**, totaling **19,574,894,733 bytes** before compression.
- `build.json`: immutable [resource input release](https://github.com/zktfjcksxk-spec/iCSM/releases/tag/data-inputs-v1-20261009), volume sizes/hashes and full archive hash.
- `../scripts/build_data.py`: MSL compilation, matching app manifest generation and resource packaging.
- `../scripts/join_data.py`: Windows/macOS/Linux volume reconstruction with SHA-256 validation.

The resource inputs contain existing compiled maps, models, textures, audio and the local workshop add-on. Their original map/model authoring projects are not available here. Packaging these inputs is distinct from rebuilding a map/model from its authoring project. Metal libraries are recompiled from actual MSL sources. Runtime Printstream and native-menu overlays remain in the app's source/resources.

The Mac job compiles shaders and the app. The Linux job downloads one input volume at a time and writes ordinary ZIP bytes directly to 1 GiB transport volumes, without retaining the uncompressed resource tree. **Use the IPA and data from the same full-build release.**

Resources retain their original ownership and licensing conditions. Repository visibility is unchanged; private Release inputs require repository access. Forks do not copy Release assets. See the guide for `DATA_RELEASE_TOKEN` or copying the identical indexed assets to another accessible GitHub repository.

## 简体中文

新的 **Build iCSM IPA + Data** 工作流仅使用 GitHub 输入，生成配套的未签名 IPA 与数据 ZIP，不依赖 iCloud。

仓库包含 **7,906 份真实 Metal 着色器源码**、编译参数、**4,792 个资源**的校验清单与打包脚本。大资源以分卷存放在 [输入 Release](https://github.com/zktfjcksxk-spec/iCSM/releases/tag/data-inputs-v1-20261009)，解压后总计 **19,574,894,733 字节**。

地图和模型输入是现有编译后的资源，没有原始地图编辑／模型制作工程。工作流重新打包资源，并从真实 MSL 源码重新编译着色器。**同一次完整构建的 IPA 和数据包必须配套使用**。

仓库可见性保持不变，私有 Release 需要读取权限；Fork 不会复制附件。操作和权限配置见 [完整指南](../docs/DATA_BUILD.md#简体中文)。
