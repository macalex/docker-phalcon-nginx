FROM composer:latest as composer
FROM php:8.3-fpm

ARG PHALCON_VERSION=5.6.2

# User/Group globals
ENV MY_USER="phalcon" \
	MY_GROUP="phalcon" \
	MY_UID="1000" \
	MY_GID="1000" \
	PHP_VERSION="8.3" \
	LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

ADD ./.devops/php/conf.ini /usr/local/etc/php/conf.d/

# User and Group
RUN set -eux && \
	groupadd -g ${MY_GID} -r ${MY_GROUP} && \
	useradd -u ${MY_UID} -m -s /bin/bash -g ${MY_GROUP} ${MY_USER}

# Update
RUN apt update -y && \
    apt install -y \
        apt-utils \
        wget \
        curl \
        gettext \
        git \
        zip \
        locales \
        nano \
        sudo

# Locale
RUN echo "${LANG} UTF-8" >> /etc/locale.gen && \
    locale-gen ${LANG} && \
    update-locale LANG=${LANG}

## Phalcon
RUN set -xe && \
    cd / && \
    docker-php-source extract && \
    # Install ext-phalcon
    curl -sSLO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
    tar xzf /v${PHALCON_VERSION}.tar.gz && \
    docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) \
        /cphalcon-${PHALCON_VERSION}/build/phalcon \
    && \
    # Remove all temp files
    rm -r \
        /v${PHALCON_VERSION}.tar.gz \
        /cphalcon-${PHALCON_VERSION} \
    && \
    docker-php-source delete && \
    php -m \

# Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

CMD ["php-fpm"]