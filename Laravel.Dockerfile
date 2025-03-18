# Gunakan image resmi PHP dengan ekstensi yang dibutuhkan
FROM php:8.2-fpm-alpine

# Install dependencies yang diperlukan
RUN apk add --no-cache \ 
    bash \ 
    mysql-client \ 
    libpng-dev \ 
    libjpeg-turbo-dev \ 
    freetype-dev \ 
    oniguruma-dev \ 
    nodejs \ 
    npm

# Install ekstensi PHP yang diperlukan Laravel
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring pdo pdo_mysql zip

# Set working directory dalam container
WORKDIR /var/www

# Copy semua file proyek ke dalam container
COPY . .

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader

# Berikan permission pada storage dan bootstrap/cache agar Laravel bisa menulis
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose port untuk aplikasi Laravel
EXPOSE 9000

# Jalankan PHP-FPM
CMD ["php-fpm"]