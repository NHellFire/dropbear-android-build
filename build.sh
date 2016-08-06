#!/bin/bash
set -e
export CC=/opt/gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc

autoconf
autoheader

 ./configure --host=aarch64-linux-gnu \
 --disable-zlib \
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

make STATIC=1 MULTI=1 CC=/opt/gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc SCPPROGRESS=0 PROGRAMS="dropbear dropbearkey scp dbclient"
