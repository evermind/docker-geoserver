#!/bin/sh

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

exec bin/startup.sh
