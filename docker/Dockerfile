FROM library/openjdk:8-jre-alpine

ARG VERSION

RUN \
    apk add --update --no-cache fontconfig ttf-dejavu && \
    adduser -h /opt/geoserver-${VERSION} -s /bin/sh -D -H geoserver && \
    mkdir -p /opt && \
    cd /opt && \
    wget -q https://sourceforge.net/projects/geoserver/files/GeoServer/${VERSION}/geoserver-${VERSION}-bin.zip && \
    unzip -d geoserver-${VERSION} geoserver-${VERSION}-bin.zip && \
    rm -f  geoserver-${VERSION}-bin.zip && \
    mv /opt/geoserver-${VERSION}/data_dir /opt/geoserver_data_dir_default && \
    mkdir -p /opt/geoserver_data_dir && \
    chown -R geoserver /opt/geoserver-${VERSION} /opt/geoserver_data_dir_default /opt/geoserver_data_dir


ADD entrypoint.sh /opt/geoserver-${VERSION}/entrypoint.sh

USER geoserver
WORKDIR /opt/geoserver-${VERSION}

VOLUME /opt/geoserver_data_dir

ENV \
  GEOSERVER_COPY_DEFAULT_DATADIR=true \
  GEOSERVER_HOME=/opt/geoserver-${VERSION} \
  GEOSERVER_DATA_DIR=/opt/geoserver_data_dir \
  GEOSERVER_ADMIN_PASSWORD_HASH=digest1:D9miJH/hVgfxZJscMafEtbtliG0ROxhLfsznyWfG38X2pda2JOSV4POi55PQI4tw 

# The default admin password is "geoserver"

CMD ./entrypoint.sh
