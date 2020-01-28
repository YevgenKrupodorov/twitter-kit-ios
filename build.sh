#!/bin/bash

## Build TwitterKit.framework - x86_64
xcodebuild \
    -project TwitterKit/TwitterKit.xcodeproj \
    -scheme TwitterKit -configuration Debug \
    -sdk "iphonesimulator" \
    HEADER_SEARCH_PATHS="$(pwd)/TwitterCore/iphonesimulator/Headers $(pwd)/TwitterCore/iphonesimulator/PrivateHeaders"  \
    CONFIGURATION_BUILD_DIR=./iphonesimulator \
    clean build | xcpretty

## Build TwitterKit.framework - armv7, arm64
xcodebuild \
    -project TwitterKit/TwitterKit.xcodeproj \
    -scheme TwitterKit -configuration Debug \
    -sdk "iphoneos" \
    HEADER_SEARCH_PATHS="$(pwd)/TwitterCore/iphoneos/Headers $(pwd)/TwitterCore/iphoneos/PrivateHeaders"  \
    CONFIGURATION_BUILD_DIR=./iphoneos \
    clean build | xcpretty

## Merge into one TwitterKit.framework with x86_64, armv7, arm64
rm -rf artifacts
mkdir -p artifacts

cp -r TwitterKit/iphoneos/TwitterKit.framework/ artifacts/TwitterKit.framework
lipo -create -output artifacts/TwitterKit.framework/TwitterKit TwitterKit/iphoneos/TwitterKit.framework/TwitterKit TwitterKit/iphonesimulator/TwitterKit.framework/TwitterKit
lipo -archs artifacts/TwitterKit.framework/TwitterKit

xattr -cr artifacts
