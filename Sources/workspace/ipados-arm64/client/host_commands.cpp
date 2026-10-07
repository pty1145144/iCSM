// UIKit diagnostics use the original console buffer, on the engine's main thread.
#include "cmd.h"
#include "host.h"
extern "C" __attribute__((visibility("default"))) bool CSGOIOSHostReady() {
    return host_initialized;
}
extern "C" __attribute__((visibility("default"))) void CSGOIOSQueueCommand(const char *command) {
    if (host_initialized && command) Cbuf_AddText(CBUF_FIRST_PLAYER, command);
}
