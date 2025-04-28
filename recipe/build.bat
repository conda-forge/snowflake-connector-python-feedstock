@echo on

set SF_NO_COPY_ARROW_LIB=1
set "SF_ARROW_LIBDIR=%LIBRARY_LIB%"
set ENABLE_EXT_MODULES=1
%PYTHON% -m pip install -vvv --no-deps --no-build-isolation .
