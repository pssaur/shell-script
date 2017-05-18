#!/bin/bash
InstallApache2()
{
	sudo apt-get install apache2
}
InstallPHP7()
{
	#sudo apt-get install php5 libapache2-mod-php5
	#sudo apt-get install python-software-properties
	sudo add-apt-repository ppa:ondrej/php-7.0
	sudo apt-get update
	sudo apt-get purge php5-fpm
	sudo apt-get install php7.0-cli 
	sudo apt-get install php7.0-common 
	sudo apt-get install libapache2-mod-php7.0 
	sudo apt-get install php7.0 
	sudo apt-get install php7.0-mysql 
	sudo apt-get install php7.0-fpm 
	sudo apt-get install php7.0-curl 
	sudo apt-get install php7.0-gd 
	sudo apt-get install php7.0-bz2
	sudo apt-get install php7.0-mbstring
}

InstallMySQLServer()
{
	sudo apt-get install mysql-server
}

InstallPHPMyAdmin()
{
	sudo apt install phpmyadmin
	sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
	sudo a2enconf phpmyadmin.conf
	#sudo systemctl reload apache2.service
	#cd /var/www/html/
	#sudo wget https://files.phpmyadmin.net/phpMyAdmin/4.5.3.1/phpMyAdmin-4.5.3.1-all-languages.zip
	#sudo unzip phpMyAdmin-4.5.3.1-all-languages.zip
	#sudo mv phpMyAdmin-4.5.3.1-all-languages/ phpmyadmin/
	#sudo mkdir -m 777 phpmyadmin/config/
	#sudo /etc/init.d/apache2 restart
}
InstallJava()
{
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
}

InstallApache2
InstallMySQLServer
InstallPHP7
InstallPHPMyAdmin

