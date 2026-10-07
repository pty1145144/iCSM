#pragma once
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif
#define SOURCE_TOUCH_API __attribute__((visibility("default")))

/* Rect coordinates in UpdateState are ORIGINAL SOURCE RENDER PIXELS.
   Touch callbacks use UIKit points; the module applies no aim gain. */
typedef struct SourceTouchRect { float x, y, width, height; } SourceTouchRect;
typedef enum SourceTouchMode { SourceTouchModeMenu=0, SourceTouchModeGameplay=1 } SourceTouchMode;
typedef enum SourceTouchPhase { SourceTouchBegan=0, SourceTouchMoved=1, SourceTouchEnded=2, SourceTouchCancelled=3 } SourceTouchPhase;
typedef enum SourceTouchAction {
    SourceTouchAttack=0, SourceTouchAttack2=1, SourceTouchDuck=2,
    SourceTouchJump=3, SourceTouchReload=4, SourceTouchUse=5,
    SourceTouchWalk=6, SourceTouchActionCount=7
} SourceTouchAction;
typedef enum SourceTouchCommand {
    SourceTouchPause=0, SourceTouchScoreboard=1, SourceTouchBuy=2,
    SourceTouchInspect=3, SourceTouchDrop=4, SourceTouchCommandCount=5
} SourceTouchCommand;

typedef struct SourceTouchWeapon {
    int slot;             /* Actual Source inventory slot represented as 1..5. */
    int entity_index;     /* Actual weapon entity, supplied by the host. */
    int subtype;          /* Actual weapon subtype, supplied by the host. */
    bool selected;
    const char *name_utf8; /* Copied during UpdateState. May be NULL. */
} SourceTouchWeapon;

typedef struct SourceTouchState {
    uint32_t struct_size; /* sizeof(SourceTouchState), checked before reading. */
    SourceTouchMode mode;
    bool active;
    bool in_game; /* Exact engine IsInGame state, independent of menu/capture. */
    bool game_input; /* false with scoreboard open: only its close control responds. */
    bool scoreboard_open;
    bool radar_valid;
    bool score_valid;
    SourceTouchRect radar; /* Actual displayed original HUD bounds in render pixels. */
    SourceTouchRect score;
    float render_width;
    float render_height;
    const SourceTouchWeapon *weapons;
    size_t weapon_count;
    /* Physical calibration: native panel distance -> current UIKit screen. */
    float native_landscape_width_pixels; /* Design's M5 default: 2420. */
    float native_density_ppi;            /* Design's M5 default: 264. */
    float calibrated_points_per_mm;     /* >0 overrides panel-derived scale. */
} SourceTouchState;

typedef struct SourceTouchCallbacks {
    uint32_t struct_size; /* sizeof(SourceTouchCallbacks) */
    void (*action)(void *user, SourceTouchAction action, bool pressed, double timestamp);
    /* x positive right, y positive forward; unit circle, no acceleration. */
    void (*move)(void *user, float x, float y, double timestamp);
    /* Actual linear UIKit-point displacement, once per actual sample. */
    void (*look)(void *user, float dx_points, float dy_points, double timestamp);
    void (*command)(void *user, SourceTouchCommand command, double timestamp);
    void (*weapon_select)(void *user, int entity_index, int subtype, double timestamp);
    /* Called at cancel/mode/focus transitions: host discards queued look samples. */
    void (*reset)(void *user, double timestamp);
    /* Main-thread state refresh, called outside the UI mutex before routing
       or rendering. Must not drain queued input samples. */
    void (*frame)(void *user);
} SourceTouchCallbacks;

/* One scene. Call before drawing; returns false on unsupported device/API. */
SOURCE_TOUCH_API bool SourceTouchInitialize(void *metal_device);
SOURCE_TOUCH_API void SourceTouchShutdown(void);
/* Opens the main-thread UIKit editor; saved coordinates are view fractions. */
SOURCE_TOUCH_API void SourceTouchOpenLayoutEditor(void);
SOURCE_TOUCH_API bool SourceTouchIsEditing(void);
SOURCE_TOUCH_API void SourceTouchEditPlayerName(const char *current, void (*completion)(const char *));
SOURCE_TOUCH_API bool SourceTouchSessionActive(void);
/* Original VGUI console uses SDL text events and UIKit's keyboard geometry. */
SOURCE_TOUCH_API void SourceTouchConsoleSetVisible(bool visible);
SOURCE_TOUCH_API bool SourceTouchConsoleIsVisible(void);
SOURCE_TOUCH_API float SourceTouchConsoleAvailableHeight(void);
/* SDL MFi enumeration filters this one framework-created controller only. */
SOURCE_TOUCH_API bool SourceTouchOwnsGameController(void *game_controller);
SOURCE_TOUCH_API void SourceTouchSetCallbacks(const SourceTouchCallbacks *callbacks, void *user);
SOURCE_TOUCH_API void SourceTouchUpdateState(const SourceTouchState *state);
/* Main-thread attach from SDL_uikitview setSDLWindow. NULL is ignored because
   an older replaced view may detach after the new Metal view attaches. */
SOURCE_TOUCH_API void SourceTouchAttachView(void *view);
/* Main-thread hook from SDL UIKit layout/didMoveToWindow, and before touches.
   Captures view.bounds/safeArea/traits; render thread never queries UIKit. */
SOURCE_TOUCH_API void SourceTouchSetView(void *view);
/* view=UIView*, touches=singleton NSSet<UITouch*>*, event=UIEvent*.
   Keep the route chosen at touch-down through release/cancel, even if the UI
   changes mode. False continues the original SDL absolute-pointer path. */
SOURCE_TOUCH_API bool SourceTouchUIKitTouches(void *view, void *touches, void *event, int phase);
/* Called by SDL before a UIKit orientation transition; releases SDL fingers
   through SDL_SendTouch and cancels gameplay ownership, including 180 flips. */
SOURCE_TOUCH_API void SourceTouchUIKitOrientationChanging(void *view);
/* Append a load/store pass to the EXISTING command buffer/drawable texture,
   after Source presentation copy and before presentDrawable. No new queue. */
SOURCE_TOUCH_API void SourceTouchRenderMetal(void *command_buffer, void *drawable_texture);
SOURCE_TOUCH_API void SourceTouchCancelAll(double timestamp);
/* Layout diagnostics. Returns bytes excluding NUL, or 0 for an invalid buffer. */
SOURCE_TOUCH_API size_t SourceTouchCopyDiagnosticsJSON(char *buffer, size_t capacity);
/* Exercises the SAME ownership/router functions with synthetic coordinate
   fixtures; never fabricates UITouch and never invokes host callbacks. */
SOURCE_TOUCH_API size_t SourceTouchRoutingSelfTestJSON(char *buffer, size_t capacity);

#if defined(__cplusplus)
}
#endif
