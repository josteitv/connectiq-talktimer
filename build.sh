#!/bin/bash

APP_NAME=connectiq-talktimer

SDK_URL="https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-win-2.3.4.zip"

PROJECT_HOME="${PWD}"
RESOURCES_FOLDER="resources"
SOURCE_FOLDER="source"
BUILD_DIR=build
SDK_FILE="${BUILD_DIR}/sdk.zip"
SDK_DIR="${BUILD_DIR}/sdk"

mkdir -p ${BUILD_DIR}

wget -O "${SDK_FILE}" "${SDK_URL}"
unzip "${SDK_FILE}" "bin/*" -d "${SDK_DIR}"

openssl genrsa -out ${BUILD_DIR}/key.pem 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in ${BUILD_DIR}/key.pem -out ${BUILD_DIR}/key.p8.der -nocrypt

RESOURCES="`cd /; find \"${PROJECT_HOME}/${RESOURCES_FOLDER}\"* -iname '*.xml' | tr '\n' ':'`"
SOURCES="`cd /; find \"${PROJECT_HOME}/${SOURCE_FOLDER}\" -iname '*.mc' | tr '\n' ' '`"

# Compile with tests
#java -jar "${SDK_DIR}/bin/monkeybrains.jar" --unit-test --manifest manifest.xml --output ${BUILD_DIR}/${APP_NAME}.iq --release --warn --private-key ${BUILD_DIR}/key.p8.der --rez ${RESOURCES} ${SOURCES}

# Run tests (requires a running simulator)
#"${SDK_DIR}/bin/monkeydo" "${BUILD_DIR}/${APP_NAME}.prg" -t


# Package
java -jar "${SDK_DIR}/bin/monkeybrains.jar" --package-app --manifest manifest.xml --output ${BUILD_DIR}/${APP_NAME}.iq --release --warn --private-key ${BUILD_DIR}/key.p8.der --rez ${RESOURCES} ${SOURCES}



