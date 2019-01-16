#!/bin/sh -e

if [ ! -z "${GEOSERVER_ADMIN_PASSWORD_HASH}" ]; then
  cat << EOF > /opt/geoserver_data_dir/security/usergroup/default/users.xml
<?xml version="1.0" encoding="UTF-8"?>
<userRegistry version="1.0" xmlns="http://www.geoserver.org/security/users">
    <users>
        <user enabled="true" name="admin" password="${GEOSERVER_ADMIN_PASSWORD_HASH}"/>
    </users>
    <groups/>
</userRegistry>
EOF
fi

if [ "${GEOSERVER_COPY_DEFAULT_DATADIR}" == "true" ]; then
  echo "Copying default data dir"
  cp -av /opt/geoserver_data_dir_default/* /opt/geoserver_data_dir/
fi

if [ -d /opt/geoserver_extra_libs ]; then
  echo "Copying extra libs ... "
  cp -av /opt/geoserver_extra_libs/*.jar ${GEOSERVER_HOME}/webapps/geoserver/WEB-INF/lib/
fi

echo "Starting geoserver"
exec bin/startup.sh
