#!/bin/bash

set -exuo pipefail

export SF_NO_COPY_ARROW_LIB=1
export SF_ARROW_LIBDIR="${PREFIX}/lib"
export ENABLE_EXT_MODULES=true

${PYTHON} -m pip install -vvv --no-deps --no-build-isolation .

