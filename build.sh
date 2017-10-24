#!/bin/bash

APP_NAME=connectiq-talktimer

SDK_URL="https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-win-2.3.4.zip"
SDK_FILE="sdk.zip"
SDK_DIR="sdk"

PEM_FILE="/tmp/developer_key.pem"
DER_FILE="/tmp/developer_key.der"

wget -O "${SDK_FILE}" "${SDK_URL}"
unzip "${SDK_FILE}" "bin/*" -d "${SDK_DIR}"

openssl genrsa -out "${PEM_FILE}" 4096
openssl pkcs8 -topk8 -inform PEM -outform DER -in "${PEM_FILE}" -out "${DER_FILE}" -nocrypt

PROJECT_HOME="${PWD}"
RESOURCES_FOLDER="resources"
SOURCE_FOLDER="source"
RESOURCES="`cd /; find \"${PROJECT_HOME}/${RESOURCES_FOLDER}\"* -iname '*.xml' | tr '\n' ':'`"
SOURCES="`cd /; find \"${PROJECT_HOME}/${SOURCE_FOLDER}\" -iname '*.mc' | tr '\n' ' '`"

"${SDK_DIR}/bin/monkeydo" "${PROJECT_HOME}/${APP_NAME}.prg" -t

java -jar "${SDK_DIR}/bin/monkeybrains.jar" --package-app --manifest manifest.xml --output \"${APP_NAME}.iq\" --release --warn --private-key \"${DER_FILE}\" --rez \"${RESOURCES}\"

