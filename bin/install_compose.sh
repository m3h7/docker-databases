#!/bin/bash
#
# Downloads docker-compose and install in in ~/bin

RELEASE=1.18.0

mkdir -p ~/bin
curl -L https://github.com/docker/compose/releases/download/$RELEASE/docker-compose-`uname -s`-`uname -m` \
  -o ~/bin/docker-compose

chmod 755 ~/bin/docker-compose
