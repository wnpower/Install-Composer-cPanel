#!/bin/bash
rm -rf ~/bin/composer
mkdir -p ~/bin/composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
cd ~
php composer-setup.php --install-dir=./bin/composer
php -r "unlink('composer-setup.php');"
sed -i '/alias composer/d' ~/.bashrc
alias composer="/opt/cpanel/$(ls /opt/cpanel/ | grep "ea-php" | sort -n | tail -1)/root/usr/bin/php -d allow_url_fopen=1 -d disable_functions=none -d detect_unicode=0 ~/bin/composer/composer.phar"
echo 'alias composer="/opt/cpanel/$(ls /opt/cpanel/ | grep "ea-php" | sort -n | tail -1)/root/usr/bin/php -d allow_url_fopen=1 -d disable_functions=none -d detect_unicode=0 ~/bin/composer/composer.phar"' >> ~/.bashrc

echo "¡Listo!, recuerda reiniciar la terminal para aplicar los cambios"

exit 0
