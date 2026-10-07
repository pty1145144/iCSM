#!/bin/sh
set -eu
: "${TARGET_BUILD_DIR:?Xcode target build directory is required}"
: "${FULL_PRODUCT_NAME:?Xcode product name is required}"
/usr/bin/xattr -cr "$TARGET_BUILD_DIR/$FULL_PRODUCT_NAME"
