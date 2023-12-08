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
RUN apt-get update

RUN apt-get install -y python3 python3-pip python3-venv && python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install certbot-dns-godaddy
RUN pip3 install certbot certbot-dns-google-domains

RUN apt-get install -y certbot cron

RUN echo "0 0 * * * certbot renew --quiet" | crontab -
