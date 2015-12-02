#!/usr/bin/env bash

# Configure aptitude
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"

# Include docker
# Disabled by default, as it triples provision time. Enable if you'll use it.
#curl -sSL https://get.docker.com/ | sh
#usermod -aG docker vagrant

# Install required packages
apt-get update
apt-get install -y \
    htop \
    wget \
    curl \
    mysql-server-5.6 \
    nginx \
    php5-cli \
    php5-curl \
    php5-fpm \
    php5-gd \
    php5-mcrypt \
    php5-mysql \
    php5-xdebug

# Configure nginx
cp $CONFIG_LOCATION/nginx.conf /etc/nginx/nginx.conf
sed -i "s/PUBLIC_DIR/$PUBLIC_DIR/g" /etc/nginx/nginx.conf
sed -i "s/FRONT_CONTROLLER/$FRONT_CONTROLLER/g" /etc/nginx/nginx.conf
[ -d /etc/nginx/sites-enabled ] && rm -rf /etc/nginx/sites-enabled
[ -d /etc/nginx/sites-available ] && rm -rf /etc/nginx/sites-available
service nginx restart

# Configure database
cp $CONFIG_LOCATION/my.cnf ~/.my.cnf && chmod 600 ~/.my.cnf
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" ~/.my.cnf
mysql < $CONFIG_LOCATION/init.sql

# Configure PHP
sed -i "s/;date.timezone =/date.timezone = $PHP_TIMEZONE/g" /etc/php5/{fpm,cli}/php.ini
for dir in /etc/php5/{fpm,cli}/conf.d/; do [ ! -f "$dir" ] && cp "$CONFIG_LOCATION/xdebug.ini" "$dir"; done;
cp $CONFIG_LOCATION/fpm-pool.conf /etc/php5/fpm/pool.d/
service php5-fpm restart

# Configure composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Mailcatcher
#apt-get install -y build-essential libsqlite3-dev ruby1.9.1-dev && gem install mailcatcher
