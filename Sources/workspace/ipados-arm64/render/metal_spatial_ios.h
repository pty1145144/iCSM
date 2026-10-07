#pragma once
// Explicit Source scene rectangles; never inferred from a texture label.
struct ICSMSceneRect { int x, y, width, height; };
using ICSMSpatialSceneFn = bool (*)(const ICSMSceneRect *, const ICSMSceneRect *);
