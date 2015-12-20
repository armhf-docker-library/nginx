FROM armhfbuild/debian:jessie

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb-src http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.9

RUN apt-get update && \
    apt-get install -y ca-certificates

COPY nginx_signing.key /tmp/
RUN apt-key add /tmp/nginx_signing.key

RUN apt-get -y build-dep nginx

RUN cd /tmp \
 && apt-get source nginx \
 && cd nginx-${NGINX_VERSION} \
 && dpkg-buildpackage -uc -b \
 && cd .. \
 && rm nginx-${NGINX_VERSION} -fR \
 && mv nginx_${NGINX_VERSION}-*.deb /
RUN dpkg -i /nginx_${NGINX_VERSION}-*.deb

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
