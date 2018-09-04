FROM php:7.2-fpm-alpine

WORKDIR /var/www
RUN rm -rf html

RUN set -ex && apk --no-cache add \
    ca-certificates \
    openssh-client \
    git \
    libxml2-dev \
    curl-dev

RUN apk --no-cache add libpng-dev postgresql-dev postgresql \
    --repository http://dl-cdn.alpinelinux.org/alpine/v3.6/main/

RUN docker-php-ext-install pdo pdo_pgsql pgsql zip xml curl mbstring gd

COPY docker.conf /usr/local/etc/php-fpm.d/
COPY php.logs.ini /usr/local/etc/php/conf.d/logs.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
