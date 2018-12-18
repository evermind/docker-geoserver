# Automated docker builds for geoserver

This script is triggered daily via travis.ci. It scans http://geoserver.org for current releases.
Then it checks docker hub if a tag for this release exists already. If not, a new docker image is built and pushed.

The docker image uses the same (semantic) versions as geoserver. There's no "latest" tag!

# Usage of the image

docker run -it --rm -p 8080:8080 evermind/geoserver:VERSION

The following volumes exists:

* /opt/geoserver_data_dir - GEOSERVER_DATA_DIR (contains all configs)
* /opt/geoserver_data_di/data - Shapefiles - use an volume, and init-container or a host-mounted path to publish data to it

