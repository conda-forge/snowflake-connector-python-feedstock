@echo on

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if errorlevel 1 exit 1

:: Use the protobuf code shipped in the sdist (see build.sh)
set SKIP_PROTO_GENERATION=1

:: sf_core's build.rs needs protoc; otherwise it downloads one (see build.sh)
set "PROTOC=%BUILD_PREFIX%\Library\bin\protoc.exe"
if not exist "%PROTOC%" exit 1

%PYTHON% -m pip install -vv --no-deps --no-build-isolation .
if errorlevel 1 exit 1
