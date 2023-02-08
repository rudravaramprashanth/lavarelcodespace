FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libicu-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install curl \
    && docker-php-ext-install xml \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_mysql

COPY . /var/www/html

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php \
    && php composer.phar install \
    && chown -R www-data:www-data /var/www/html