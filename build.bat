@echo off

if not exist build mkdir build

if not exist build\key.pem openssl genrsa -out build/key.pem 4096
if not exist build\key.p8.der openssl pkcs8 -topk8 -inform PEM -outform DER -in build/key.pem -out build/key.p8.der -nocrypt

setlocal ENABLEDELAYEDEXPANSION

set RESOURCES=
for /f %%f in ('dir /s/b resources\*.xml') do set "RESOURCES=!RESOURCES!;%%f"
set RESOURCES=%RESOURCES:~1%

set SOURCES=
for /f %%f in ('dir /s/b source\*.mc') do set "SOURCES=!SOURCES! %%f"

monkeyc --unit-test --manifest manifest.xml --output build\connectiq-talktimer.prg --warn --private-key build\key.p8.der --rez %RESOURCES% %SOURCES%

monkeyc --package-app --manifest manifest.xml --output build\connectiq-talktimer.iq --release --warn --private-key build\key.p8.der --rez %RESOURCES% %SOURCES%

