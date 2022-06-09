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
sudo apt install apache2 -y
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
sudo apt install php -y
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Instalación de GIT                                  +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt install git -y
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Instalación de Ufw                                  +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt install ufw-y
sudo ufw enable
sleep 2
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Descargamos de Github                               +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
cd /var/www/html
sudo git clone https://github.com/CdeCASA/Projecte.git
cd /home/$USER
sleep2
clear

#############

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                 Administración del Apache                           +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+                                                                     +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
echo
echo
echo "A continuacion vamos a crear un usuario, este usuario será el que podra acceder al panel de control"
echo
echo
echo
echo "Dame el nombre del usuario a crear:"
read usuario
sudo htpasswd -c /etc/apache2/.segura $usuario

################

sudo echo 'www-data ALL=NOPASSWD:ALL' >> /etc/sudoers
sudo chmod 777 /etc/netplan

###############

sudo rm /var/www/html/index.html
sudo chmod -R 777 /var/www/html/Projecte
sudo chown -R www-data:www-data /var/www/html/Projecte
sudo echo '127.0.0.1    panelcontrol.com' >> /etc/hosts
################

sudo echo '<VirtualHost *:*>' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'ServerName panelcontrol.com' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'DocumentRoot /var/www/html/Projecte/' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'CustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/projecte.conf
sudo echo '<Directory "/var/www/html/Projecte/">' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'AuthType Basic' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'AuthName "Projecte"' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'AuthBasicProvider file' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'AuthUserFile "/etc/apache2/.segura"' >> /etc/apache2/sites-available/projecte.conf
sudo echo 'Require valid-user' >> /etc/apache2/sites-available/projecte.conf
sudo echo '</Directory>' >> /etc/apache2/sites-available/projecte.conf
sudo echo '</VirtualHost>' >> /etc/apache2/sites-available/projecte.conf
a2ensite projecte.conf
a2dissite 000-default.conf
sudo systemctl restart apache2.service
clear
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                                                                                                           +"
echo "+                                                                                                           +"
echo "+                                                                                                           +"
echo "+                 Instalacion terminada                                                                     +"
echo "+                                                                                                           +"
echo "+                                                                                                           +"
echo "+                 Para acceder al panel de control tiene dos formas de acceder:                             +"
echo "+                                                                                                           +"
echo "+                 Mediante -> localhost                                                                     +"
echo "+                             panelcontrol.com                                                              +"
echo "+                                                                                                           +"
echo "+                 El usuario para acceder es el creado con anterioridad                                     +"
echo "+                                                                                                           +"
echo "+                                                                                                           +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
