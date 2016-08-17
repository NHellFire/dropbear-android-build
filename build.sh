#!/bin/bash
set -e

case "$1" in
	arm)
		HOST=arm-linux-gnueabihf
		;;
	arm64)
		HOST=aarch64-linux-gnu
		;;
	*)
		echo "Usage: $0 {arm|arm64}"
		exit 1
esac

make clean || true

autoconf
autoheader

./configure --host=${HOST} \
 --disable-largefile \
 --disable-loginfunc \
 --disable-shadow \
 --disable-utmp \
 --disable-utmpx \
 --disable-wtmp \
 --disable-wtmpx \
 --disable-pututline \
 --disable-pututxline \
 --disable-lastlog \
 --disable-syslog

make strip STATIC=1 MULTI=1 SCPPROGRESS=0 PROGRAMS="dropbear dropbearkey scp dbclient"
