FROM php:7.3-alpine

RUN apk add --no-cache zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer create-project symfony/skeleton build

RUN rm -f ./build/vendors/ var/

RUN zip build.zip ./build/

RUN ls -la
