cmake_minimum_required(VERSION 3.31)
project(CSGOI5Client LANGUAGES C CXX OBJCXX)
set(PORT "${CMAKE_CURRENT_LIST_DIR}/../..")
set(CACHE_ROOT "$ENV{HOME}/Library/Caches/csgo-ipados-arm64" CACHE PATH "Local module build cache")
set(ICSM_FRAMEWORK_DIR "${CACHE_ROOT}/i5/client-build/Frameworks" CACHE PATH "Native iOS frameworks")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)
set(CMAKE_INSTALL_RPATH "@executable_path/Frameworks")
set(I5_TEAM "" CACHE STRING "Development team")
set(I5_BUNDLE_ID "local.csgo.ipados.i0probe" CACHE STRING "Existing app slot")
add_executable(CSGOI5Client MACOSX_BUNDLE main.mm data_install.mm
 "${PORT}/vendor/minizip-1.3.1/unzip.c" "${PORT}/vendor/minizip-1.3.1/ioapi.c"
 "${PORT}/provenance/i0/asset-content-manifest.json")
set_source_files_properties("${PORT}/provenance/i0/asset-content-manifest.json" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
# Keep signed manifest resource name stable for runtime lookup.
add_custom_command(TARGET CSGOI5Client PRE_BUILD COMMAND ${CMAKE_COMMAND} -E copy "${PORT}/provenance/i0/asset-content-manifest.json" "${CMAKE_CURRENT_BINARY_DIR}/original-assets.json")
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/original-assets.json")
set_source_files_properties("${CMAKE_CURRENT_BINARY_DIR}/original-assets.json" PROPERTIES GENERATED TRUE MACOSX_PACKAGE_LOCATION Resources)
target_compile_options(CSGOI5Client PRIVATE "$<$<COMPILE_LANGUAGE:OBJCXX>:-fobjc-arc>" -Wall -Wextra -Wno-deprecated-declarations)
target_link_libraries(CSGOI5Client PRIVATE z "-framework Metal" "-framework UIKit" "-framework Foundation" "-framework CoreText" "-framework Network")
set_target_properties(CSGOI5Client PROPERTIES MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist"
 XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
 XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "${I5_BUNDLE_ID}" XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "${I5_TEAM}"
 XCODE_ATTRIBUTE_CODE_SIGN_STYLE Automatic XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
 XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME AppIcon
 XCODE_ATTRIBUTE_SUPPORTED_PLATFORMS iphoneos XCODE_ATTRIBUTE_SUPPORTS_MACCATALYST NO
 XCODE_ATTRIBUTE_SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD NO XCODE_ATTRIBUTE_GENERATE_INFOPLIST_FILE NO
 XCODE_ATTRIBUTE_CODE_SIGN_ENTITLEMENTS "${PORT}/app/i0/Memory.entitlements")
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/Assets.xcassets")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/Assets.xcassets" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/LaunchScreen.storyboard")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/LaunchScreen.storyboard" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/native-ui")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/native-ui" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/local-workshop/icsm-profile.json")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/local-workshop/icsm-profile.json" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/video-preset.json")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/video-preset.json" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/fresh-video-preset.json")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/fresh-video-preset.json" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/fresh-video.kv")
set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/fresh-video.kv" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
foreach(resource distribution-assets.json fresh-client-defaults.cfg)
 target_sources(CSGOI5Client PRIVATE "${CMAKE_CURRENT_LIST_DIR}/resources/${resource}")
 set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/resources/${resource}" PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
endforeach()
file(GLOB frameworks "${ICSM_FRAMEWORK_DIR}/*.framework")
list(LENGTH frameworks framework_count)
if(NOT framework_count EQUAL 35)
 message(FATAL_ERROR "Expected 35 native iOS frameworks; received ${framework_count}")
endif()
set_target_properties(CSGOI5Client PROPERTIES XCODE_EMBED_FRAMEWORKS "${frameworks}"
 XCODE_EMBED_FRAMEWORKS_CODE_SIGN_ON_COPY YES XCODE_EMBED_FRAMEWORKS_REMOVE_HEADERS_ON_COPY YES)
# Apple QA1940: Finder resource metadata cannot be present in a signed bundle.
# Xcode runs target post-build scripts before its final application CodeSign.
add_custom_command(TARGET CSGOI5Client POST_BUILD
 COMMAND /bin/sh "${CMAKE_CURRENT_LIST_DIR}/clean_bundle_metadata.sh" VERBATIM)
