FROM httpd:alpine

LABEL description="friendica"
LABEL NAME="friendica"
LABEL VERSION="0.1a"

ENV HTTPD_CONF /usr/local/apache2/conf/
ENV HTTPD_MODS_AVAILABLE ${HTTPD_CONF}mods-available
ENV HTTPD_SITES_AVAILABLE ${HTTPD_CONF}sites-available
ENV HTTPD_MODS_ENABLED ${HTTPD_CONF}mods-enabled
ENV HTTPD_SITES_ENABLED ${HTTPD_CONF}sites-enabled

COPY httpd.conf "${HTTPD_CONF}"

RUN set -euvx; \
        mkdir -p "/var/www/"


COPY test.html /var/www/index.html

CMD [ "httpd-foreground" ]
EXPOSE 80