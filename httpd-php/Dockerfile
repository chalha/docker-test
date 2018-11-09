FROM alpine

LABEL description="apache-php"
LABEL NAME="apache-php"
LABEL VERSION="0.1a"


COPY installscripts /tmp/
RUN sh /tmp/apr.sh
#RUN sh /tmp/httpd2.sh
#RUN sh /tmp/php.sh

#COPY httpd.conf /usr/local/apache2/conf/httpd.conf
#COPY test.php /var/www/index.php
#RUN ln -s /usr/local/apache2/bin/apachectl /usr/local/bin/apachectl
#RUN sh /tmp/httpd2-cleanup.sh
#RUN sh /tmp/php-cleanup.sh
#RUN rm -R /tmp/*
CMD [ "sh" ]
EXPOSE 80