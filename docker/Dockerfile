FROM library/openjdk:8-jre-alpine

ARG VERSION

RUN \
    apk add --update --no-cache fontconfig ttf-dejavu && \
    adduser -h /opt/geoserver-${VERSION} -s /bin/sh -D -H geoserver && \
    mkdir -p /opt && \
    cd /opt && \
    wget -q http://sourceforge.net/projects/geoserver/files/GeoServer/${VERSION}/geoserver-${VERSION}-bin.zip && \
    unzip geoserver-${VERSION}-bin.zip && \
    rm -f  geoserver-${VERSION}-bin.zip && \
    chown -R geoserver /opt/geoserver-${VERSION} && \
    mv /opt/geoserver-${VERSION}/data_dir /opt/geoserver_data_dir

USER geoserver
WORKDIR /opt/geoserver-${VERSION}

VOLUME /opt/geoserver_data_dir /opt/geoserver_data_dir/data

ENV \
  GEOSERVER_HOME=/opt/geoserver-${VERSION} \
  GEOSERVER_DATA_DIR=/opt/geoserver_data_dir

CMD bin/startup.sh
