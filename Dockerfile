FROM alpine:3.8 
MAINTAINER Rhodix <https://github.com/rhodix>

RUN apk update \
    && apk add --no-cache dnsmasq \
    && rm -rf /var/cache/apk/*

RUN echo "user=root" > /etc/dnsmasq.conf
RUN echo 'conf-dir=/etc/dnsmasq.d/,*.conf' >> /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq","-k","--port=10053"]
