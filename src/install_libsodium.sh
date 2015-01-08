#!/bin/bash
source /opt/from_dockerfile/env.sh

mkdir --verbose --parents ~/src/libsodium
pushd ~/src/libsodium

curl -O https://download.libsodium.org/libsodium/releases/libsodium-1.0.1.tar.gz
tar zxf libsodium-1.0.1.tar.gz
cd libsodium-1.0.1

./configure
make check
make install

popd
