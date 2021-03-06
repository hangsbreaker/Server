#!/bin/bash
# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
service unifi stop
mongod --dbpath /usr/lib/unifi/data/db --smallfiles --logpath /usr/lib/unifi/logs/server.log --repair
chown -R unifi:unifi /usr/lib/unifi/data/db/
chown -R unifi:unifi /usr/lib/unifi/logs/server.log
service unifi start
