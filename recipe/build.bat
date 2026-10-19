@echo on

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if errorlevel 1 exit 1

:: Use the protobuf code shipped in the sdist (see build.sh)
set SKIP_PROTO_GENERATION=1

%PYTHON% -m pip install -vv --no-deps --no-build-isolation .
if errorlevel 1 exit 1
