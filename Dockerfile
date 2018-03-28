FROM richarvey/nginx-php-fpm
RUN apk add --no-cache --virtual .build-deps \
    autoconf \
    gcc \
    libc-dev \
    make \
    openssl-dev \
    pcre-dev \
    zlib-dev \
    linux-headers \
    curl \
    gnupg \
    libxslt-dev \
    gd-dev \
    geoip-dev \
    perl-dev \
    luajit-dev && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb && \
    apk del gcc musl-dev linux-headers libffi-dev augeas-dev python-dev make autoconf