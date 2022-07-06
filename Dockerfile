ARG alpineversion=3.16

FROM alpine:${alpineversion} AS builder
ARG primer3version=2.6.1
WORKDIR /build
RUN apk --no-cache add build-base && \
    wget -O - https://github.com/primer3-org/primer3/archive/refs/tags/v${primer3version}.tar.gz | tar --strip-components=1 -xz && \
    cd src && \
    make LIBOPTS=-static PREFIX=/opt/primer3 install && \
    strip /opt/primer3/bin/* && \
    cp -R primer3_config /opt/primer3

ARG alpineversion=3.16
FROM alpine:${alpineversion} as primer3
WORKDIR /root/
COPY --from=builder /opt/primer3 /opt/primer3
ENV PATH=/opt/primer3/bin:$PATH
CMD ["primer3_core"]
