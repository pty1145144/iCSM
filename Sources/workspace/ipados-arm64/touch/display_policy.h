#pragma once
#include <algorithm>
#include <cmath>

// Source renders to an offscreen Metal backbuffer. Keep the actual window
// aspect ratio while limiting the short edge to 1080 pixels; never upscale.
namespace ICSMDisplay {
struct Size { unsigned width, height; };
// The measured phone medium recipe renders about 1.70 million scene pixels.
// Preserve that budget on other display ratios instead of stretching the image
// or multiplying GPU cost on a 4:3 iPad. Round both dimensions to even pixels.
inline Size PhoneMedium(Size aspect) {
    if (!aspect.width || !aspect.height) return {0, 0};
    const double ratio = double(aspect.width) / aspect.height;
    const double width = (std::min)(1920.0, std::sqrt(1920.0 * 884.0 * ratio));
    auto even = [](double v) { return (std::max)(2u, unsigned(std::round(v / 2.0)) * 2); };
    return {even(width), even(width / ratio)};
}
// Match the saved high-tier aspect. Multiples of six give even source pixels
// when MetalFX's 2/3 scene scale is applied; the short edge remains exact.
inline Size Preset(Size high, unsigned height, bool upscale) {
    if (!high.width || !high.height || !height) return {0, 0};
    const unsigned alignment = upscale ? 6 : 2;
    unsigned width = unsigned(std::round(double(high.width) * height / high.height / alignment)) * alignment;
    return {(std::max)(alignment, width), height};
}
inline Size Automatic(unsigned width, unsigned height) {
    if (!width || !height) return {0, 0};
    if (width < height) std::swap(width, height);
    const double factor = (std::min)(1.0, 1080.0 / height);
    auto even = [](double value) { return (std::max)(2u, unsigned(std::floor(value / 2.0)) * 2); };
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
