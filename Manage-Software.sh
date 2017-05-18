#!/bin/bash
InstallApache()
{
	sudo apt-get install apache2
}
RemoveApache()
{
	sudo service apache2 stop
	#This will remove just the apache2 package itself.
	sudo apt-get remove apache2*
	#Remove apache2 packages and dependencie
	sudo apt-get autoremove
}
PurgeApache()
{
	#If you also want to delete your local/config files for apache2 then this will work.
	sudo apt-get purge apache2
	sudo apt-get purge apache2-utils 
	sudo apt-get purge apache2.2-bin 
	sudo apt-get purge apache2-common
	sudo apt-get purge --auto-remove apache2
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
RemovePHPMyAdmin()
{
	sudo apt-get remove phpmyadmin
 
}
PurgePHPMyAdmin()
{
	sudo apt-get purge phpmyadmin
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
RemovePHP7()
{
	sudo apt-get remove php5 
	sudo apt-get remove libapache2-mod-php5
	sudo apt-get purge php5-fpm
	sudo apt-get remove python-software-properties
	sudo apt-get remove php7.0-cli 
	sudo apt-get remove php7.0-common 
	sudo apt-get remove libapache2-mod-php7.0 
	sudo apt-get remove php7.0 
	sudo apt-get remove php7.0-mysql 
	sudo apt-get remove php7.0-fpm 
	sudo apt-get remove php7.0-curl 
	sudo apt-get remove php7.0-gd php7.0-bz2
	sudo apt-get remove php7.0-mbstring
}
PurgePHP7()
{
	sudo apt-get purge php5 
	sudo apt-get purge libapache2-mod-php5
	sudo apt-get purge php5-fpm
	sudo apt-get purge python-software-properties
	sudo apt-get purge php7.0-cli 
	sudo apt-get purge php7.0-common 
	sudo apt-get purge libapache2-mod-php7.0 
	sudo apt-get purge php7.0 
	sudo apt-get purge php7.0-mysql 
	sudo apt-get purge php7.0-fpm 
	sudo apt-get purge php7.0-curl 
	sudo apt-get purge php7.0-gd php7.0-bz2
	sudo apt-get purge php7.0-mbstring
}

InstallMySQL()
{
	sudo apt-get install mysql-server 
	sudo apt-get install mysql-client
}
RemoveMySql()
{
	sudo service mysql stop
	sudo /etc/init.d/mysql stop
	sudo apt-get remove mysql-server 
	sudo apt-get remove mysql-client
}
PurgeMySql()
{
	sudo service mysql stop
	sudo /etc/init.d/mysql stop
	sudo apt-get purge mysql-server 
	sudo apt-get purge mysql-client
}

InstallTomcat()
{
}
RemoveTomcat()
{
}
PurgeTomcat()
{
}


InstallJava()
{
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
}
RemoveJava()
{
	##To remove JDK completely, run the commands given below(one-by-one) from terminal:-
	sudo apt-get remove oracle-java8-installer
	sudo apt-get autoremove
}
PurgeJava()
{
	##To remove JDK completely, run the commands given below(one-by-one) from terminal:-
	sudo apt-get purge oracle-java8-installer
	sudo apt-get autoremove
}

utility()
{
       echo "[1] Show Todays date/time"
       echo "[2] Show files in current directory"
       echo "[3] Show calendar"
       echo "[4] Start editor to write letters"
	read yourch
     
	case $yourch in
	   1) echo "Today is `date` , press a key. . ." ; read ;;
	   2) echo "Files in `pwd`" ; ls -l ; echo "Press a key. . ." ; read ;;
	   3) cal ; echo "Press a key. . ." ; read ;;
	   4) vi ;;
	   q) exit 0 ;;
	   *) echo "Opps!!! Please select choice 1,2,3,4, or 5";
	echo "Press a key. . ." ; read ;;
	esac

}
hold_to_view_log()
{
echo "Press a key. . ." ; read ;
}

#echo "apache - want to remove from this machine? (y/n)"
#read f
#if [ "$f" == 'y' -o "$f" == 'Y' ] 
#then 
#RemoveApache2; 
#fi


#
# Script to create simple menus and take action according to that selected menu item
#
while :
do
	clear
	echo "-------------------------------------"
	echo " Manage Software "
	echo "-------------------------------------"
	echo "[3] Apche"
	echo "[4] MySql"
	echo "[5] PHP7"
	echo "[6] PHPMyAdmin"
	#echo "[1] Java8 (JDK+JRE)"
	echo "[2] LAMP"
	echo "[7] Tomcat8"
	#echo "[8] Scala"
	#echo "[9] Perl"
	#echo "[10] gcc"
	echo "[q] Exit/Stop"
	echo "======================="
	echo -n "Enter your menu choice [1-5]: "
	read yourch
     
	case $yourch in
		2) 
		printf "Press i for Install, r for remove and p for purge\n"
		read ch
			case $ch in 
				i) InstallApache ; InstallMySQL; InstallPHP7; InstallPHPMyAdmin; hold_to_view_log ;;
			  	r) RemoveApache  ; RemoveMySql;  RemovePHP7 ; RemovePHPMyAdmin;  hold_to_view_log ;;
	 			p) PurgeApache   ; PurgeMySql;   PurgePHP7;   PurgePHPMyAdmin;   hold_to_view_log ;; 
				*) echo "Please enter correct value.";
				echo "Press a key. . ." ; read ;;		
			esac
		 ;;
		 	
	   3) 
		printf "Press i for Install, r for remove and p for purge\n"
		read ch
			case $ch in 
				i) InstallApache ; hold_to_view_log ;;
			  	r) RemoveApache  ; hold_to_view_log ;;
	 			p) PurgeApache   ; hold_to_view_log ;; 
				*) echo "Please enter correct value.";
				echo "Press a key. . ." ; read ;;		
			esac
		 ;;

	   4) 
		printf "Press i for Install, r for remove and p for purge\n"
		read ch
			case $ch in 
				i) InstallMySQL; hold_to_view_log ;;
			  	r) RemoveMySql ; hold_to_view_log ;;
	 			p) PurgeMySql  ; hold_to_view_log ;;
				*) echo "Please enter correct value.";
				echo "Press a key. . ." ; read ;;		
			esac
		 ;;

	   5) 
		printf "Press i for Install, r for remove and p for purge\n"
		read ch
			case $ch in 
				i) InstallPHP7; hold_to_view_log ;;
			  	r) RemovePHP7 ; hold_to_view_log ;;
	 			p) PurgePHP7  ; hold_to_view_log ;;
				*) echo "Please enter correct value.";
				echo "Press a key. . ." ; read ;;		
			esac
		 ;;
	
	   6) 
		printf "Press i for Install, r for remove and p for purge\n"
		read ch
			case $ch in 
				i) InstallPHPMyAdmin; hold_to_view_log ;;
			  	r) RemovePHPMyAdmin ; hold_to_view_log ;;
	 			p) PurgePHPMyAdmin  ; hold_to_view_log ;;
				*) echo "Please enter correct value.";
				echo "Press a key. . ." ; read ;;		

			esac
		 ;;
	   q) exit 0 ;;
	   *) echo "Please enter correct value.";
	echo "Press a key. . ." ; read ;;
	esac
done

echo " -- Finish --";
#for f in $( ls /var/ ); do echo $f; done 