FROM alpine:latest AS builder

RUN set -ex \
    && apk add --no-cache \
        build-base \
        git \
        autoconf \
        automake \
    && cd /tmp \
    && git clone "https://github.com/samhocevar/rinetd" \
    && cd rinetd \
    && ./bootstrap \
    && ./configure --prefix=/usr \
    && make

FROM alpine:latest

RUN apk add openconnect --no-cache  --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY --from=builder /tmp/rinetd/rinetd /usr/sbin/rinetd
COPY entrypoint.sh /entrypoint.sh
COPY connectvpn.sh /connectvpn.sh

RUN chmod +x /entrypoint.sh \
    && chmod +x /connectvpn.sh

ENTRYPOINT /entrypoint.sh
