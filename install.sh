#!/usr/bin/env bash
git submodule update --init

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export CMAKE_PREFIX_PATH=$CONDA_PREFIX
    conda install -y numpy pyyaml mkl setuptools cmake gcc cffi
    conda install -y -c soumith magma-cuda80
    python setup.py install
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export CMAKE_PREFIX_PATH=$CONDA_PREFIX
    conda install -y numpy pyyaml setuptools cmake cffi
    MACOSX_DEPLOYMENT_TARGET=10.9 CC=clang CXX=clang++ python setup.py install
fi
