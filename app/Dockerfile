FROM php:apache
RUN bash -c "a2enmod rewrite && a2enmod ssl"
RUN chown -R www-data:www-data /var/www

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    calendar \
    exif \
    gd \
    intl \
    mysqli \
    opcache \
    pdo \
    pdo_mysql \
    zip
