#!/bin/sh

HTTPD_VERSION="2.4.37"
HTTPD_DIST_URL="https://www-eu.apache.org/dist/httpd/"
HTTPD_PREFIX="/usr/local/apache2"

#apache manager public key 
#PGP_PUB_MGMT_FINGERPRINT="A93D62ECC3C8EA12DB220EC934EA76E6791485A8"

HTTPD_FILE="httpd-$HTTPD_VERSION.tar.bz2"
# ensure www-data user exists
addgroup -g 82 -S www-data
adduser -u 82 -D -S -G www-data www-data

#Wird für nghttp2 benötigt git autoconfauta automake
apk add --no-cache --virtual .build-deps gcc apr-dev apr-util-dev dpkg-dev dpkg build-base pcre-dev coreutils git autoconf automake libtool pkgconf libressl-dev libev-dev zlib-dev c-ares-dev 
cd /tmp
git clone https://github.com/nghttp2/nghttp2.git
cd nghttp2
autoreconf -i
automake
autoconf
./configure
make 
make install
cd /tmp
wget "$HTTPD_DIST_URL$HTTPD_FILE" || exit 1
#wget "$HTTPD_DIST_URL$HTTPD_FILE.asc" || exit 1
#gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $PGP_PUB_MGMT_FINGERPRINT
#gpg --verify "$HTTPD_FILE.asc" $HTTPD_FILE | exit 1
mkdir -p src
tar xjf $HTTPD_FILE --directory src
rm $HTTPD_FILE

cd "/tmp/src/httpd-$HTTPD_VERSION"
gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"
./configure \
    --build="$gnuArch0" \
    --prefix="$HTTPD_PREFIX" \
    --enable-mods-shared=reallyall \
    --enable-mpms-shared=all

make -j "$(nproc)"
make install
cd /tmp
rm -R src