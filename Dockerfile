# Description: test image

FROM busybox:latest
#assign some metadata
LABEL maintainer="liuguoyun ChesterLew1026@gmail.com"
#copy file to 

ENV DOC_ROOT /data/web/html/ \
    WEB_SERVER_PACKAGE="nginx-1.15.8.tar.gz"

COPY index.html ${DOC_ROOT:-/data/web/html/}
#COPY index.html /data/web/html/
#COPY ssh /etc/ssh/

ADD http://nginx.org/download/nginx-1.15.8.tar.gz /usr/local/src/

WORKDIR /usr/local/src/
#ADD ${WEB_SERVER_PACKAGE:-nginx-1.15.8}.tar.gz ./

VOLUME /data/mysql

EXPOSE 80/tcp

RUN cd /usr/local/src && \
 tar xf ${WEB_SERVER_PACKAGE}