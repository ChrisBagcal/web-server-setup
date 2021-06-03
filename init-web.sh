#!/bin/sh

script_name=${0##*/}

[ "$USER" != "root" ] && { echo "$script_name: run as root" >&2; exit 1; }


