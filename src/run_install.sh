#!/bin/bash
curl https://install.sandstorm.io > /opt/from_dockerfile/installer.sh
chmod +x /opt/from_dockerfile/installer.sh
/opt/from_dockerfile/installer.sh -eu
