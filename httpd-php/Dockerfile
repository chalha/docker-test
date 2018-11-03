FROM alpine

LABEL description="apache-php"
LABEL NAME="apache-php"
LABEL VERSION="0.1a"


COPY installscripts /tmp/

RUN sh /tmp/httpd2.sh

CMD [ "sh" ]
EXPOSE 80