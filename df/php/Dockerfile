FROM php:8.1.7-cli
RUN apt update
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer install