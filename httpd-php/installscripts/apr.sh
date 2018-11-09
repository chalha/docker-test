#!/bin/sh
cd /tmp
APR_NAME="apr-1.6.5"
APR_UTIL_NAME="apr-util-1.6.1"
APR__ICONV_NAME="apr-iconv-1.2.2"
wget http://mirror.dkd.de/apache//apr/apr-1.6.5.tar.bz2
wget http://mirror.dkd.de/apache//apr/apr-util-1.6.1.tar.bz2
wget http://mirror.dkd.de/apache//apr/apr-iconv-1.2.2.tar.bz2

mkdir src
tar xjf apr-1.6.5.tar.bz2 -C /tmp/src
tar xjf apr-util-1.6.1.tar.bz2 -C /tmp/src
tar xjf apr-iconv-1.2.2.tar.bz2 -C /tmp/src

cd /tmp/src/$APR_NAME
./configure