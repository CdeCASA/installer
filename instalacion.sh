#!/bin/bash
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+            Script de Instalación del Panel de Control               +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Actualizar repositorios                             +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt update
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Instalación de Apache                               +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt install apache2
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Instalación de PHP                                  +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt install php

echo "Usuario"
read usuario
sudo htpasswd -c /etc/apache2/.segura $usuario
sudo rm /etc/apache2/sites-available/000-default.conf
echo '<VirtualHost *:80>' >> /etc/apache2/sites-available/000-default.conf
echo 'ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/000-default.conf
echo 'DocumentRoot /var/www/html' >> /etc/apache2/sites-available/000-default.conf
echo 'ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/000-default.conf
echo 'CustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/000-default.conf
echo '<Directory "/var/www/html/">' >> /etc/apache2/sites-available/000-default.conf
echo 'AuthType Basic' >> /etc/apache2/sites-available/000-default.conf
echo 'AuthName "Privat"' >> /etc/apache2/sites-available/000-default.conf
echo 'AuthBasicProvider file' >> /etc/apache2/sites-available/000-default.conf
echo 'AuthUserFile "/etc/apache2/.segura"' >> /etc/apache2/sites-available/000-default.conf
echo 'Require valid-user' >> /etc/apache2/sites-available/000-default.conf
echo '</Directory>' >> /etc/apache2/sites-available/000-default.conf
echo '</VirtualHost>' >> /etc/apache2/sites-available/000-default.conf

sudo systemctl restart apache2.service














