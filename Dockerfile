FROM php:7.3-apache

RUN apt-get update \  
    && apt-get install -y \
        libmcrypt-dev \
        libz-dev \
		libzip-dev \
        git \
        wget \
		supervisor \
	&& pecl install mcrypt-1.0.2 \
    && docker-php-ext-install \
        mbstring \
        pdo_mysql \
		zip \
	&& docker-php-ext-enable mcrypt \	

    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer
