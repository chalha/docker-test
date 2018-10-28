FROM httpd:alpine

ENV HTTPD_CONF /usr/local/apache2/conf/
ENV HTTPD_MODS_AVAILABLE ${HTTPD_CONF}mods-available
ENV HTTPD_SITES_AVAILABLE ${HTTPD_CONF}sites-available
ENV HTTPD_MODS_ENABLED ${HTTPD_CONF}mods-enabled
ENV HTTPD_SITES_ENABLED ${HTTPD_CONF}sites-enabled

COPY httpd.conf "${HTTPD_CONF}"
COPY mods-available "${HTTPD_MODS_AVAILABLE}"
COPY sites-available "${HTTPD_SITES_AVAILABLE}"

RUN set -euvx; \
        mkdir -p "${HTTPD_MODS_ENABLED}"; \
        mkdir -p "${HTTPD_SITES_ENABLED}"

RUN set -euvx; \
        ln -s "${HTTPD_MODS_AVAILABLE}"/mod_mpm_event.conf "${HTTPD_MODS_ENABLED}"/mod_mpm_event.conf; \
        ln -s "${HTTPD_MODS_AVAILABLE}"/mod_http2.conf "${HTTPD_MODS_ENABLED}"/mod_http2.conf; \
        ln -s "${HTTPD_MODS_AVAILABLE}"/mod_proxy_http2.conf "${HTTPD_MODS_ENABLED}"/mod_proxy_http2.conf; \
        ln -s "${HTTPD_MODS_AVAILABLE}"/mod_proxy.conf "${HTTPD_MODS_ENABLED}"/mod_proxy.conf

RUN set -euvx; \
        ln -s "${HTTPD_SITES_AVAILABLE}"/default.conf "${HTTPD_SITES_ENABLED}"/default.conf

CMD [ "httpd-foreground" ]