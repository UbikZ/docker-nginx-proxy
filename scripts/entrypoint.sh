#!/bin/bash

set -e

NGINX_DEST="/etc/nginx/sites-enabled"
[[ ! -d "${NGINX_DEST}" ]] && mkdir -p "${NGINX_DEST}"

[[ "${NGINX_PROD}" -eq 0 ]] && PATTERN="*.prod.conf" || PATTERN="*.dev.conf"

for CONF_FILE in `find /nginx/sites-templated -type f -name ${PATTERN}`; do
	cp -rp "${CONF_FILE}" "${NGINX_DEST}"
done;

nginx -g 'daemon off;'