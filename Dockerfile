FROM alpine:edge
# for arm64
# match the U-NAS Uanywhere service, which frps version is 0.12.0

ENV WEBDAV_VERSION 3.0.0

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache wget  \
    && export all_proxy='socks5://192.168.1.108:7890' http_proxy='http://192.168.1.108:7890' https_proxy='http://192.168.1.108:7890' \
    && cd /tmp \
    &&  wget --no-check-certificate -c https://github.com/hacdias/webdav/releases/download/v${WEBDAV_VERSION}/linux-arm64-webdav.tar.gz \
    &&  tar -xf linux-arm64-webdav.tar.gz  \
    &&  cp webdav /usr/bin/ \
    &&  mkdir -p /etc/webdav \
    &&  touch /etc/webdav/webdav.yaml  \
    &&  rm -rf /tmp/* \
    &&  unset all_proxy https_proxy http_proxy \
    &&  apk del wget

ENTRYPOINT /usr/bin/webdav -c /etc/webdav/webdav.yaml
