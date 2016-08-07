#!/bin/bash
set -e

autoconf
autoheader

 ./configure --host=aarch64-linux-gnu \
 --disable-largefile \
 --disable-loginfunc \
 --disable-shadow \
 --disable-utmp \
 --disable-utmpx \
 --disable-wtmp \
 --disable-wtmpx \
 --disable-pututline \
 --disable-pututxline \
 --disable-lastlog

make strip STATIC=1 MULTI=1 SCPPROGRESS=0 PROGRAMS="dropbear dropbearkey scp dbclient"
