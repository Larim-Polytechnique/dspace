#!/bin/bash
set -e

if [ "${1}" = "run" ];then
    set -- catalina.sh "$@"
fi

mkdir -p $CATALINA_HOME/conf/Catalina/localhost

for webapp in $(ls /dspace/webapps/); do
    # Exclue jspui parce qu'il n'est pas compilable avec tomcat8
    if [ "$webapp" != "jspui" ]; then
        {
            echo "<?xml version='1.0'?>"
            echo "<Context"
            echo docBase=\"/dspace/webapps/$webapp\"
            echo 'reloadable="true"'
            echo 'cachingAllowed="false"/>'
        } > $CATALINA_HOME/conf/Catalina/localhost/$webapp.xml
    fi
done

cp $CATALINA_HOME/conf/Catalina/localhost/{xmlui,ROOT}.xml
sed -i "s/localhost:5432/db:5432/" /dspace/config/dspace.cfg

exec "$@"
