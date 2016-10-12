FROM alpine:3.4

ENV OTP_VERSION 19.1

RUN apk add --virtual build-deps --no-cache build-base ncurses-dev perl \
    && wget http://erlang.org/download/otp_src_${OTP_VERSION}.tar.gz \
    && tar xf otp_src_${OTP_VERSION}.tar.gz \
    && cd otp_src_${OTP_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -r otp_src_${OTP_VERSION}* \
    && apk del build-deps