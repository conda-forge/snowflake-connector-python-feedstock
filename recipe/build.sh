#!/bin/bash

set -exuo pipefail

if [[ "${build_platform}" != "${target_platform}" ]]; then
  pushd ${SP_DIR//$PREFIX/$BUILD_PREFIX}/pyarrow
    for i in `ls libarrow_python.so.*`; do
	cp libarrow_python.so $i
    done
  popd
fi

export SF_NO_COPY_ARROW_LIB=1
export SF_ARROW_LIBDIR="${PREFIX}/lib"
export ENABLE_EXT_MODULES=true

${PYTHON} -c 'import Cython'
${PYTHON} -c 'import numpy'
${PYTHON} -c 'import pyarrow'
${PYTHON} -m pip install -vvv --no-deps --no-build-isolation .

