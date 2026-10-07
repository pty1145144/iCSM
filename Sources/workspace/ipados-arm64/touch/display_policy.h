#pragma once
#include <algorithm>
#include <cmath>

// Source renders to an offscreen Metal backbuffer. Keep the actual window
// aspect ratio while limiting the short edge to 1080 pixels; never upscale.
namespace ICSMDisplay {
struct Size { unsigned width, height; };
inline Size Automatic(unsigned width, unsigned height) {
    if (!width || !height) return {0, 0};
    if (width < height) std::swap(width, height);
    const double factor = std::min(1.0, 1080.0 / height);
    auto even = [](double value) { return std::max(2u, unsigned(std::floor(value / 2.0)) * 2); };
    return {even(width * factor), even(height * factor)};
}
// Match original CCSGO_VideoSettingsScreen::GetAspectRatioIndex, which groups
// nonstandard display ratios with the nearest original dropdown category.
inline unsigned Aspect(Size size) {
    const double ratio = double(size.width) / size.height;
    const double ratios[] = {4.0 / 3.0, 16.0 / 9.0, 16.0 / 10.0};
    unsigned closest = 0;
    for (unsigned i = 1; i < 3; ++i)
        if (std::fabs(ratio - ratios[i]) < std::fabs(ratio - ratios[closest])) closest = i;
    return closest;
}
}
