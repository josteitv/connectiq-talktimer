#!/bin/bash

APP_NAME=connectiq-talktimer

SDK_URL="https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-win-3.0.3-2018-9-11-7881c24.zip"

PROJECT_HOME="${PWD}"
RESOURCES_FOLDER="resources"
SOURCE_FOLDER="source"
BUILD_DIR=./build
SDK_FILE="${BUILD_DIR}/sdk.zip"
SDK_DIR="${BUILD_DIR}/sdk"

mkdir -p ${BUILD_DIR}

wget -O "${SDK_FILE}" "${SDK_URL}"
unzip "${SDK_FILE}" "bin/*" -d "${SDK_DIR}"

openssl genrsa -out ${BUILD_DIR}/key.pem 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in ${BUILD_DIR}/key.pem -out ${BUILD_DIR}/key.p8.der -nocrypt

# monkeyc wont run on linux
# ${SDK_DIR}/bin/monkeyc --package-app --jungles monkey.jungle --output ${BUILD_DIR}/${APP_NAME}.iq --release --warn --private-key ${BUILD_DIR}/key.p8.der

# Package
java -jar "${SDK_DIR}/bin/monkeybrains.jar" --package-app --jungles monkey.jungle --output ${BUILD_DIR}/${APP_NAME}.iq --release --warn --private-key ${BUILD_DIR}/key.p8.der
