FROM alpine:3.4

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

ENV DNSPERF_VER="2.1.0.0"

RUN apk update && \
    apk add --no-cache \
    bind-dev bind-libs bind-tools krb5-libs krb5-dev \
    openssl-dev libcap-dev libxml2-dev \
    build-base wget && \
    wget ftp://ftp.nominum.com/pub/nominum/dnsperf/$DNSPERF_VER/dnsperf-src-$DNSPERF_VER-1.tar.gz && \
#    wget ftp://ftp.nominum.com/pub/nominum/dnsperf/data/queryfile-example-current.gz && \
#    gunzip queryfile-example-current.gz && \
    tar zxvf dnsperf-src-$DNSPERF_VER-1.tar.gz && \
    rm dnsperf-src-$DNSPERF_VER-1.tar.gz && \
    cd dnsperf-src-$DNSPERF_VER-1 && \
    ./configure && \
    make && \
    make install && \
    apk del bind-dev bind-libs bind-tools krb5-libs krb5-dev \
    openssl-dev libcap-dev libxml2-dev \
    build-base && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* /dnsperf-src-$DNSPERF_VER-1

WORKDIR /root
