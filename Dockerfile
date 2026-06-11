FROM php:8.2-apache

# Instal dependensi OS yang dibutuhkan Laravel & Node.js
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Bersihkan cache instalasi
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instal ekstensi PHP (termasuk pdo_mysql untuk database)
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Konfigurasi Apache DocumentRoot (Diarahkan ke folder /public Laravel)
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
ENV ASSET_URL "https://hobikecil64-final.onrender.com"
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Sesuaikan port dengan environment variable dari Render
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Aktifkan mod_rewrite Apache (Penting untuk routing Laravel)
RUN a2enmod rewrite

# Ambil Composer versi terbaru
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory ke folder aplikasi
WORKDIR /var/www/html

# Copy semua file project ke dalam container
COPY . /var/www/html

# Jalankan instalasi dependensi vendor
RUN composer install --no-dev --optimize-autoloader

# Install NPM dependencies dan build aset frontend (Vite/Tailwind)
RUN npm install
RUN npm run build

# Berikan hak akses yang benar untuk folder storage dan cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
