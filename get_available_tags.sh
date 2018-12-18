#!/bin/bash


TAGS=$( curl -s "http://geoserver.org/download/" | sed -rn "s~.*<a .*?>GeoServer (.*)</a>.*~\1~p" | sort -n -r | uniq )
if [ -z "${TAGS}" ]; then
	echo "No releases found at http://geoserver.org/download/ - check the website and the script $0" >&2
	exit 1
fi
echo ${TAGS}
