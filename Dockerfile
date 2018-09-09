FROM alpine:latest
MAINTAINER Rhodix <https://github.com/rhodix>

RUN apk update \
    && apk add --no-cache dnsmasq \
    && rm -rf /var/cache/apk/* \
    && echo "user=root" > /etc/dnsmasq.conf \
    && echo 'conf-dir=/etc/dnsmasq.d/,*.conf' >> /etc/dnsmasq.conf

EXPOSE 10053/tcp 10053/udp

ENTRYPOINT ["dnsmasq","-k","--port=10053"]
