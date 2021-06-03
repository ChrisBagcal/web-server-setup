#!/bin/sh

script_name=${0##*/}

if [ "$USER" != "root" ]; then
	echo "$script_name: run as root" >&2
	exit 1
fi

## Systemd services
services="nginx"
progs="nginx"

systemctl disable $services
systemctl stop $services

web_user="www-data"
(id $web_user 2>/dev/null) && userdel $web_user
#[ -f ./webtodo.txt ]	&& rm ./webtodo.txt
[ -d /etc/nginx/ ]	&& rm -rf /etc/nginx/
[ -d /etc/systemd/system/nginx.service.d/ ] && rm -rf /etc/systemd/system/nginx.service.d

## Debian
apt purge $progs
apt install $progs
systemctl stop $services
