// Providers contain the unchanged upstream implementations in static archives.
// Keep them in one signed framework so registries are shared across Source modules.
extern "C" __attribute__((visibility("default"))) const char *CSGOIOSProviderBuild() {
    return "arm64-iphoneos-upstream-provider";
}
