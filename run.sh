#!/bin/sh
clear
DATE=`date +%d-%m-%Y-%H-%M`

if [ "$#" != "2" ]; then
	echo "\n\n\n2 ARGUMENTS NEEDED"
	echo "1) clean(clean project) or NA (for running project without cleaning"
	echo "2) Tags selected for test run ex: @sanity or @reg"
	echo "\nsample command: sh run.sh clean @sanity\n"
	exit
fi

if [ -z "$2" ] ; then
echo "Tags not specified using @failed"
tagged_test=@failed
else
tagged_test=$2
fi

PROJ_NAME="MJTransitionEffect"
SCHEME_XC="MJTransitionEffect-cal"
BUILD_CONFIG="Debug"
ARCHITECTURE_SELECTED=i386
APPNAME="MJTransitionEffect"
PROJ_LOC="../MJTransitionEffect/MJTransitionEffect.xcodeproj"


if [ "$1" == "clean" ] ; then
echo "cleaning and building"
killall Xcode
xcodebuild  -scheme "${SCHEME_XC}" -project "${PROJ_LOC}" -configuration Debug ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator build
fi

BUILT_PRODUCTS_DIR=$(xcodebuild -project "${PROJ_LOC}" ARCHS="${ARCHITECTURE_SELECTED}" ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator  -configuration "${BUILD_CONFIG}" -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*" | xargs -L1 dirname)

APP_BUNDLE_PATH_VAR="${BUILT_PRODUCTS_DIR}"/"${BUILD_CONFIG}"-iphonesimulator/"${APPNAME}".app
echo $APP_BUNDLE_PATH_VAR

echo BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p ios features/  --tag $tagged_test
BUNDLE_ID=$BUNDLE DEVICE=iphone APP_BUNDLE_PATH="${APP_BUNDLE_PATH_VAR}" bundle exec cucumber -p ios features/  --tag $tagged_test
