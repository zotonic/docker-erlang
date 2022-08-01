FROM alpine:3.12.1

ENV OTP_VERSION 21.3

RUN apk add --no-cache ncurses \
    && apk add --virtual build-deps --no-cache build-base ncurses-dev openssl-dev perl \
    && wget http://erlang.org/download/otp_src_${OTP_VERSION}.tar.gz \
    && tar xf otp_src_${OTP_VERSION}.tar.gz \
    && cd otp_src_${OTP_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -r otp_src_${OTP_VERSION}* \
    && apk del build-deps

# Fix for untrusted keys https://gitlab.alpinelinux.org/alpine/aports/-/issues/14043
RUN apk upgrade
RUN apk add -X https://dl-cdn.alpinelinux.org/alpine/v3.16/main -u alpine-keys
