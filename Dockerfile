FROM ubuntu:16.04
MAINTAINER Mahadi <mhm2k9@gmail.com>

# Disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# Install PHP
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
    apache2 \
    php7.0 \
    php7.0-cli \
    libapache2-mod-php7.0 \
    php-apcu \
    php-intl \
    php-imagick \
    php-mcrypt \
    php7.0-json \
    php7.0-gd \
    php7.0-curl \
    php-xdebug \
    php7.0-ldap \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-pgsql \
    php7.0-sqlite3 \
    php7.0-xml \
    php7.0-xsl \
    php7.0-zip \
    php7.0-soap \
    php7.0-opcache \
    composer

# Install system CURL
RUN apt-get update && \
    apt-get install -y curl

COPY apache2.conf /etc/apache2/apache2.conf
COPY . /var/www/html/
RUN chmod -R 744 /var/www/html/ && \
   chown www-data -R /var/www/html/

RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
