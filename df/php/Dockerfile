FROM php:8.1.7-cli
RUN apt update
RUN apt install zip
RUN apt install git # Not happy about that, for for now stays
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer