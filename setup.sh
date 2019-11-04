#!/bin/sh
set -eu

apk update
apk upgrade
apk add  bash
apk add ca-certificates
adduser -D -H -u 1000 -s /bin/bash www-data
rm /etc/nginx/conf.d/default.conf
