#!/bin/bash
set -e

if [ "${1}" = "run" ];then
    set -- catalina.sh "$@"
fi

ln -sf /dspace/webapps/* $CATALINA_HOME/webapps/
sed -i "s/localhost:5432/db:5432/" /dspace/config/dspace.cfg

exec "$@"
