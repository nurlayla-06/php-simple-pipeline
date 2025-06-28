FROM php:8.1-cli

COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y unzip git curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install

CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]
