#!/bin/bash
while [ ! -d ~/sandstorm ]
do
	source /opt/from_dockerfile/run_install.sh
done

source /opt/from_dockerfile/run_start.sh
