#!/bin/bash
export CXX="clang++"
export CC="clang"

while [ ! -d ~/sandstorm ]
do
	source /opt/from_dockerfile/run_install.sh
done

source /opt/from_dockerfile/run_start.sh
