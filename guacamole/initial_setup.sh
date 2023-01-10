#!/bin/sh
DOCKERDATA=~/docker-data/

if ! (docker ps >/dev/null 2>&1)
then
        echo "docker daemon not running, will exit here!"
        exit
fi
echo "Preparing folder init and creating {DOCKERDATA}guacamole/init/initdb.sql"
mkdir ${DOCKERDATA}guacamole/init >/dev/null 2>&1
chmod -R +x ${DOCKERDATA}guacamole/init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ${DOCKERDATA}guacamole/init/initdb.sql
echo "done"