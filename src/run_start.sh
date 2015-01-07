#!/bin/bash
pushd /opt/sandstorm/sandstorm

#tree
#./sandstorm help
#./sandstorm help start
#supervisord --configuration=/opt/from_dockerfile/supervisord.conf --nodaemon --logfile=~/supervisord.log
./sandstorm start
tree ./var/log
tail -f ./var/log/sandstorm.log

popd
