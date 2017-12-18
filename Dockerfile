FROM hypriot/rpi-alpine
MAINTAINER zepptron <https://github.com/zepptron>

ENV VERSION 0.15.2
ADD https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-armv7.tar.gz /node_exporter.tar.gz

RUN apk update && \
    apk add --no-cache tar && \
    tar -xf /node_exporter.tar.gz && \
    rm /node_exporter.tar.gz && \
    mv node_exporter-${VERSION}.linux-armv7/node_exporter /usr/bin/node_exporter && \
    rm -fr node_exporter-${VERSION}.linux-armv7

EXPOSE 9100

ENTRYPOINT [ "/usr/bin/node_exporter" ]