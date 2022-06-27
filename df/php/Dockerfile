FROM php:8.1.7-cli
RUN apt update
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN apt install git -y
RUN apt install zip -y
COPY composer.json composer.json
COPY composer.lock composer.lock
RUN composer install