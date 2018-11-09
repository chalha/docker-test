#!/bin/sh
PHP_VERSION="7.2.11"
PHP_FILE="php-$PHP_VERSION.tar.bz2"
PHP_URL="http://de2.php.net/get/$PHP_FILE/from/this/mirror"

apk add --virtual .php-build-deps libxml2-dev
cd /tmp
wget $PHP_URL -O $PHP_FILE || exit 1
mkdir -p src
tar xjf $PHP_FILE --directory src
cd "src/php-$PHP_VERSION"
./configure --with-apxs2=/usr/local/apache2/bin/apxs 

make -j "$(nproc)"
make install