#!/bin/sh
PHP_VERSION="7.2.11"
PHP_FILE="php-$PHP_VERSION.tar.bz2"
PHP_URL="http://de2.php.net/get/$PHP_FILE/from/this/mirror"

apk add libxml2-dev

wget $PHP_URL -O $PHP_FILE || exit 1
mkdir -p src
tar xjf $HTTPD_FILE --directory src
cd "src/php-$VERSION"
./configure --with-apxs2=/usr/local/apache2/bin/apxs 

make -j "$(nproc)"
make install