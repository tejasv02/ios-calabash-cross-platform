#!/bin/sh
echo "Choose scheme name and update it in SCHEME_XC"
echo "click manage scheme and choose scheme name and find the build configuration BUILD_CONFIG" 
echo "if your features(automation test features) are present in different folder rather than folder where project is present , mention the path in FEATURES_PATH
or else remove the argument."
echo "APPNAME - name of the application usually same as the scheme name"
echo "PROJ_LOC - location of xcode project if thats same as current folder remove this option."


SCHEME_XC="MJTransitionEffect-cal"
BUILD_CONFIG="Debug"
FEATURES_PATH="features"
ARCHITECTURE_SELECTED=i386
APPNAME="MJTransitionEffect"
PROJ_LOC=$3"MJTransitionEffect.xcodeproj"


if [ $1 = "clean" ]
then
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator clean build
fi

if [ $1 = "build" ]
then
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR
# sample path - /Users/username/Library/Developer/Xcode/DerivedData/MJTransitionEffect-gotpnqucjsgpcjgbhavbjvjbndfs/Build/Products/Debug-iphonesimulator/MJTransitionEffect.app
echo BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p ios features/  --tag $2

BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p ios features/  --tag $2
