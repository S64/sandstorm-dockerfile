#!/bin/bash
mkdir --verbose --parents ~/src/capnproto
pushd ~/src/capnproto

curl -O https://capnproto.org/capnproto-c++-0.5.0.tar.gz
tar zxf capnproto-c++-0.5.0.tar.gz
cd capnproto-c++-0.5.0
./configure
make -j6 check
make install

popd

