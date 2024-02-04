FROM php:apache

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nano \
    python3 \
    python3-pip \
    python3-venv \
    supervisor \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite && a2enmod ssl

# Configure PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
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

# Create and activate Python virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Certbot and related packages
RUN pip install certbot-dns-godaddy==2.6.0
RUN pip3 install certbot certbot-dns-google-domains

# Set up Certbot cron job for certificate renewal
RUN echo "0 0 * * * certbot renew --quiet" | crontab -

# Configure Supervisor
RUN mkdir -p /etc/supervisor/conf.d

# Change ownership of web directory
RUN chown -R www-data:www-data /var/www

# Set up aliases and functions
RUN echo "alias lc='laravelclear'" >> /root/.bashrc
RUN echo "function laravelclear() {" >> /root/.bashrc
RUN echo "    php artisan cache:clear && php artisan route:cache && php artisan config:cache" >> /root/.bashrc
RUN echo "}" >> /root/.bashrc

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
