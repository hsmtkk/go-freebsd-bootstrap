FROM golang:1.17

RUN apt-get -y update \
 && apt-get -y install bzip2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

ADD https://go.dev/dl/go1.17.7.src.tar.gz /opt/

RUN tar fxz go1.17.7.src.tar.gz

WORKDIR /opt/go/src

ENV GOOS=freebsd GOARCH=amd64

RUN bash bootstrap.bash
