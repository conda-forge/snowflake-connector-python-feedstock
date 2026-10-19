#!/bin/bash

set -exuo pipefail

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# The sdist ships protobuf code generated with protoc 32.1. Regenerating it
# would need upstream's Rust proto_generator plus a protoc matching the
# protobuf runtime, so use the shipped files instead.
export SKIP_PROTO_GENERATION=1

if [[ "${build_platform}" != "${target_platform}" ]]; then
    export PYO3_CROSS_LIB_DIR="${PREFIX}/lib"
fi

${PYTHON} -m pip install -vv --no-deps --no-build-isolation .
