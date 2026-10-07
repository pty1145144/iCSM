# M5: original 2019 Panorama VPC implementations and native dependencies.
include(${CMAKE_CURRENT_LIST_DIR}/providers.cmake)
set(M5_TEXT_RESOLVED "${I4_CACHE}/deps/include" "${I4_CACHE}/deps/include/glib-2.0" "${I4_CACHE}/deps/lib/glib-2.0/include" "${I4_CACHE}/deps/include/pango-1.0" "${I4_CACHE}/deps/include/harfbuzz" "${I4_CACHE}/deps/include/freetype2" "${I4_CACHE}/deps/include/cairo" "${I4_CACHE}/deps/include/pixman-1")
set(M5_PARSIFAL "/Users/shupokato/Documents/eng/macos-arm64/cmake/../vendor/m5/parsifal")
add_library(parsifal STATIC)
foreach(name bistream encoding xmlhash parsifal xmlsbuf xmlvect xmlpool)
  target_sources(parsifal PRIVATE "${M5_PARSIFAL}/src/${name}.c")
endforeach()
target_include_directories(parsifal PUBLIC "${M5_PARSIFAL}/include/libparsifal")
target_compile_definitions(parsifal PRIVATE DTD_SUPPORT MAX_SPEED)
target_compile_definitions(parsifal PUBLIC UINT32=uint32_t)
target_compile_options(parsifal PUBLIC "SHELL:-include stdint.h")
set_target_properties(parsifal PROPERTIES POSITION_INDEPENDENT_CODE ON)

foreach(name panorama_s1wrapper panorama_client panorama panorama_text_pango panoramauiclient)
  if(name STREQUAL "panorama_client" OR name STREQUAL "panorama_s1wrapper")
    m3_library(${name} STATIC)
  else()
    m3_library(${name} SHARED)
  endif()
  target_compile_features(${name} PRIVATE cxx_std_14)
  target_compile_definitions(${name} PRIVATE SOURCE2_PANORAMA SOURCE2_PANORAMA_FIXME PANORAMA_USE_S1WRAPPER SPLIT_PANORAMA_TEXT _CLIENT NO_STEAM)
  target_include_directories(${name} PRIVATE "${SOURCE_ROOT}/panorama" "${SOURCE_ROOT}/panorama/steamextra/common"
    "${SOURCE_ROOT}/panorama_s1wrapper" "${SOURCE_ROOT}/public/panorama" "${SOURCE_ROOT}/gcsdk/steamextra"
    "${SOURCE_ROOT}/common" "${SOURCE_ROOT}/public/steam" "${SOURCE_ROOT}/public/vstdlib" "${SOURCE_ROOT}/thirdparty" "${SOURCE_ROOT}/thirdparty/v8/include" "${M3_VENDOR}/thirdparty/zlib-1.2.8")
  target_compile_options(${name} PRIVATE -ferror-limit=0 -Wno-deprecated-declarations -Wno-inconsistent-missing-override -Wno-deprecated-register)
  target_link_libraries(${name} PRIVATE tier2 tier3 v8 v8_libbase v8_libplatform steam_api source_messages text_provider OpenSSL::Crypto OpenSSL::SSL iconv z bz2   "-framework Security")
endforeach()
target_compile_definitions(panorama_client PRIVATE PANORAMA_CLIENT_EXPORTS)
foreach(name panorama panorama_text_pango panorama_s1wrapper)
  target_compile_definitions(${name} PRIVATE PANORAMA_EXPORTS STEAM_API_NODLL)
endforeach()
target_link_libraries(panorama PRIVATE panorama_s1wrapper parsifal cryptopp-static png15 jpeg8 bitmap vtf resourcefile togl SDL2::SDL2)
target_link_libraries(panorama_text_pango PRIVATE SDL2::SDL2)
# This 1.5 release only contains ARM32 NEON assembly; its original C filters
# are the supported native path on arm64.
target_compile_definitions(png15 PRIVATE PNG_ARM_NEON_OPT=0)
target_include_directories(panorama PRIVATE "${M3_VENDOR}/thirdparty/libpng-1.5.30" "${M3_VENDOR}/external/crypto++-5.61")
set_property(SOURCE "${SOURCE_ROOT}/panorama/source2/panoramauiengine.cpp" APPEND PROPERTY COMPILE_OPTIONS
  -include "/Users/shupokato/Documents/eng/macos-arm64/cmake/../compat/crypto_prelude.h")
target_link_libraries(panoramauiclient PRIVATE panorama_client)
target_link_libraries(panorama_text_pango PRIVATE panorama_s1wrapper)
set_target_properties(panorama_text_pango PROPERTIES NO_SYSTEM_FROM_IMPORTED ON)
target_include_directories(panorama_text_pango BEFORE PRIVATE ${M5_TEXT_RESOLVED})
set(proto "${SOURCE_ROOT}/panorama/steamextra/common/uifontfile_format.proto")
add_custom_command(OUTPUT "${CMAKE_BINARY_DIR}/generated/uifontfile_format.pb.cc" "${CMAKE_BINARY_DIR}/generated/uifontfile_format.pb.h"
  COMMAND $<TARGET_FILE:protoc> "--proto_path=${SOURCE_ROOT}/panorama/steamextra/common" "--cpp_out=${CMAKE_BINARY_DIR}/generated" "${proto}"
  DEPENDS protoc "${proto}" VERBATIM)
target_sources(panorama_text_pango PRIVATE "${CMAKE_BINARY_DIR}/generated/uifontfile_format.pb.cc")
target_compile_features(client PRIVATE cxx_std_14)
target_compile_definitions(client PRIVATE SOURCE2_PANORAMA SOURCE2_PANORAMA_FIXME)
# XML creates controls by registered name, so every original factory must survive
# static archive selection. Both VPC projects also list zip_utils.cpp; keep one copy.
get_target_property(M5_CLIENT_SOURCES client SOURCES)
list(REMOVE_ITEM M5_CLIENT_SOURCES "${SOURCE_ROOT}/public/zip_utils.cpp")
set_property(TARGET client PROPERTY SOURCES "${M5_CLIENT_SOURCES}")
target_link_libraries(client PRIVATE "$<LINK_LIBRARY:WHOLE_ARCHIVE,panorama_client>" v8 v8_libbase v8_libplatform)
target_include_directories(client PRIVATE "${SOURCE_ROOT}/common" "${SOURCE_ROOT}/thirdparty/v8/include")
target_include_directories(engine PRIVATE "${SOURCE_ROOT}/common" "${SOURCE_ROOT}/thirdparty/v8/include")
target_compile_features(engine PRIVATE cxx_std_14)
target_compile_definitions(engine PRIVATE SOURCE2_PANORAMA SOURCE2_PANORAMA_FIXME)
set_target_properties(client PROPERTIES OUTPUT_NAME client_panorama)

# Real MP3 decoder using the pinned Kisak module's VAudio002 implementation.
set(VPC_vaudio_minimp3_FILES "/Users/shupokato/Documents/eng/macos-arm64/cmake/../vendor/m5/minimp3/vaudio_minimp3.cpp")
m3_library(vaudio_minimp3 SHARED)
target_include_directories(vaudio_minimp3 PRIVATE "/Users/shupokato/Documents/eng/macos-arm64/cmake/../vendor/m5/minimp3")
target_compile_definitions(engine PRIVATE SOURCE_USE_MINIMP3)


add_library(video_ffmpeg SHARED "/Users/shupokato/Documents/eng/macos-arm64/cmake/../compat/video_ffmpeg.cpp")
target_include_directories(video_ffmpeg PRIVATE "${SOURCE_ROOT}/common")
target_link_libraries(video_ffmpeg PRIVATE source_platform ios_video)
target_compile_features(video_ffmpeg PRIVATE cxx_std_17)
target_link_libraries(panorama PRIVATE video_ffmpeg)
target_link_libraries(panorama_client PUBLIC video_ffmpeg)

foreach(name pcre pcrecpp)
 add_library(${name} STATIC IMPORTED)
 set_target_properties(${name} PROPERTIES IMPORTED_LOCATION "${I1_CACHE}/pcre-build/lib${name}.a" INTERFACE_INCLUDE_DIRECTORIES "${I1_CACHE}/pcre-build;${I1_CACHE}/pcre-source")
endforeach()
target_link_libraries(pcrecpp INTERFACE pcre)
target_link_libraries(panorama_client PUBLIC pcrecpp)
target_compile_definitions(panorama_text_pango PRIVATE SOURCE_USE_SYSTEM_PANGO)
# Missing proprietary UI components are bridged to the original local session API.
target_sources(client PRIVATE "/Users/shupokato/Documents/eng/macos-arm64/cmake/../compat/native_offline_ui.cpp")

# Capture the actual native SDL output only in M5 developer validation builds.
target_compile_definitions(soundsystem_lowlevel PRIVATE M5_NATIVE_DIAGNOSTICS)
target_sources(server PRIVATE "/Users/shupokato/Documents/eng/macos-arm64/cmake/../probes/m5_rules_diagnostics.cpp")
