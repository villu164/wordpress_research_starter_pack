FROM wordpress:latest
RUN apt update && apt install -y git zip unzip p7zip-full nano vim wget cron
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug 
RUN pecl install ast
RUN docker-php-ext-enable xdebug

RUN curl -k -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN php -r "unlink('composer-setup.php');"

# Test if composer works
RUN composer global require --dev 'phpmd/phpmd'
