FROM alpine

LABEL description="reverseproxy"
LABEL NAME="reverseproxy"
LABEL VERSION="0.1a"

RUN sed -eux ;\
    apk add nginx
    

CMD [ "httpd-foreground" ]
EXPOSE 80