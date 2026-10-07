#pragma once
#include <stdint.h>
#include <SDL_opengl.h>
// Existing Source structs contain desktop display identifiers and an opaque
// context pointer. Their original SDK widths/layout are retained as CPU data;
// the iOS renderer never creates or calls a CGL context.
typedef uint32_t CGDirectDisplayID;
typedef uint32_t CGOpenGLDisplayMask;
typedef struct _CGLContextObject *CGLContextObj;
