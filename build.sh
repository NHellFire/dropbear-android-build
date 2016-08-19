#!/bin/bash
set -e
arch="$1"
case "$arch" in
	arm)
		HOST=arm-linux-gnueabihf
		;;
	arm64)
		HOST=aarch64-linux-gnu
		;;
	all)
		"$0" arm
		"$0" arm64
		exit 0
		;;
	*)
		echo "Usage: $0 {arm|arm64}"
		exit 1
esac

targetdir="../target/$arch"

echo ">>>> Cleaning up target dir"
rm -r "$targetdir" 2> /dev/null || true

echo

echo ">>>> make clean"
make clean || true

echo

echo ">>>> configuring for $arch"
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
 --disable-syslog \
 --prefix=/data/dropbear \
 --bindir=/data/dropbear \
 --sbindir=/data/dropbear \
 --sysconfdir=/data/dropbear

echo

echo ">>>> building for $arch"
make strip STATIC=1 MULTI=1 SCPPROGRESS=0 PROGRAMS="dropbear dropbearkey scp dbclient"

echo

echo ">>>> installing $arch"
make install MULTI=1 PROGRAMS="dropbear dropbearkey scp dbclient" DESTDIR="$targetdir"

echo

echo ">>>> deleting man pages from target dir"
rm -r "$targetdir/data/dropbear/share"

echo
