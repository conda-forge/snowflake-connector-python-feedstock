#!/bin/bash

set -exuo pipefail

if [[ "${build_platform}" != "${target_platform}" ]]; then
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-}:${SP_DIR//$PREFIX/$BUILD_PREFIX}/pyarrow/"
fi

export SF_NO_COPY_ARROW_LIB=1
export SF_ARROW_LIBDIR="${PREFIX}/lib"
export ENABLE_EXT_MODULES=true

${PYTHON} -c 'import Cython'
${PYTHON} -c 'import numpy'
${PYTHON} -c 'import pyarrow'
${PYTHON} -m pip install -vvv --no-deps --no-build-isolation .

