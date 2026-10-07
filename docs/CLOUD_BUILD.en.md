# Cloud builds and installation from Windows

English | [简体中文](CLOUD_BUILD.md)

Windows users can trigger a source build on a GitHub-hosted ARM64 Mac, download the IPA, and sign and install it locally. You do not need a local Mac for this workflow. The cloud build uses Xcode 27 and compiles all 35 native frameworks from this repository's sources.

## 1. Build on GitHub

1. Open your fork or another copy of this repository that you have permission to run workflows in.
2. Open **Actions → Build iCSM IPA**. Enable Actions if GitHub asks you to enable workflows in your fork.
3. Choose **Run workflow**, select `main`, and keep the default Bundle ID and `2` compiler jobs, or enter your own Bundle ID.
4. Wait for the workflow to finish with a green check mark. Open that run and download **iCSM-IPA** under **Artifacts**.
5. Extract the downloaded artifact ZIP. It contains **`iCSM-unsigned.ipa`**, `iCSM.entitlements`, `ipa-report.json`, and `SHA256SUMS.txt`.

No Apple login, signing certificate, provisioning profile, device ID, or repository Secret is needed for the cloud build. GitHub's private-repository builds use the account's Actions allowance; hosted-runner availability and limits depend on GitHub. Artifacts are retained for seven days, after which you can run another build.

The verification step checks ZIP integrity, all 35 embedded frameworks, native ARM64 iOS binaries, bundled library dependencies, and required app resources. The report records the source commit and IPA SHA-256. In Windows PowerShell, use `Get-FileHash .\iCSM-unsigned.ipa -Algorithm SHA256` to compare the downloaded file with the report.

## 2. Sign and install on Windows

The cloud IPA uses **ad-hoc transport signatures**, with no Apple provisioning. It must be signed again with your own Apple account or certificate before installing on an ordinary iPhone or iPad.

1. Install the Windows version of [Sideloadly](https://sideloadly.io/) and its dependencies as directed by its official instructions.
2. Connect and unlock your iPhone or iPad, trust the computer, and enable Developer Mode on the device.
3. Select the device in Sideloadly, load `iCSM-unsigned.ipa`, and enter your own Apple account to sign and install.
4. If iOS asks you to trust the developer, complete that step in **Settings → General → VPN & Device Management**.

Free-account signatures normally expire after seven days; refresh or sign the app again as described in [Sideloadly's FAQ](https://sideloadly.io/faq). Keep the same Apple account and Bundle ID for updates, and install over the app to preserve imported game data and settings.

The project requests `com.apple.developer.kernel.increased-memory-limit`. Its entitlement is preserved in the ad-hoc app signature and provided separately as `iCSM.entitlements`. Final entitlements depend on your signing tool and provisioning profile. A signer that removes this entitlement may leave the app with a lower memory allowance on supported devices. Cloud build validation does not itself verify a Windows signer's behavior or device gameplay.

## 3. Import the game data

Download **[iCSM-Data.zip from iCloud](https://www.icloud.com/iclouddrive/039w_r3_mnpuCiw9Ecvmvr7zA)**. Keep this filename and **do not extract the data ZIP**.

In **Apple Devices → your device → Files → iCSM**, add `iCSM-Data.zip`. Wait for the transfer to finish, open iCSM, and tap **“检查并导入” (Check and Import)**. Allow at least **35 GB of free space** for the initial import. See the [complete data import guide](BUILD.en.md#2-import-data-from-macos-or-windows).

## Build the same export on a Mac

```sh
./icsm build --unsigned --bundle-id com.icsm.client --jobs 2
python3 scripts/verify_ipa.py Build/iCSM-unsigned.ipa --unsigned --report Build/ipa-report.json
```

This mode does not read `config.local.json`. Local builds signed with Xcode continue to use the [existing Mac instructions](BUILD.en.md).

Return to the [project homepage](https://github.com/zktfjcksxk-spec/iCSM#english).
