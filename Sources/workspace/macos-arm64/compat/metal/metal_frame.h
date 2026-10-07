#pragma once
// The original C++ host frame runs inside a Cocoa autorelease scope.
extern "C" __attribute__((visibility("default")))
void SourceMetalRunFrame(void (*frame)(float), float frameTime);
