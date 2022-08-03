#!/bin/bash
G='\033[0;32m'
NC='\033[0m'
USER='root'
PASS='root'
USERNAME='devopscilsy'
PASSWORD='1234567890'

echo -e "${G}starting provision!${NC}"
sudo su
echo -e "${G}update and upgrade entire system${NC}"
sudo apt-get -y update > /dev/null 2>&1
echo -e "${G}install mysql server${NC}"
sudo apt-get -y install mysql-server > /dev/null 2>&1
echo -e "${G}install apache2${NC}"
sudo apt-get -y install apache2 > /dev/null 2>&1
echo -e "${G}install php${NC}"
sudo apt-get -y install php > /dev/null 2>&1
echo -e "${G}install php mysql${NC}"
sudo apt-get -y install php-mysql > /dev/null 2>&1
echo -e "${G}install git${NC}"
sudo apt-get -y install git > /dev/null 2>&1
echo -e "${G}cloning db dump from repository${NC}"
cd /home/vagrant/
git clone https://github.com/sdcilsy/sosial-media.git > /dev/null 2>&1
echo -e "${G}mysql server config${NC}"
mysql -u $USER -p$PASS -e "CREATE USER 'devopscilsy'@'localhost' IDENTIFIED BY '1234567890';" >> /vagrant/vm_build.log 2>&1
mysql -u $USER -p$PASS -e "CREATE USER 'devopscilsy'@'192.168.100.101' IDENTIFIED BY '1234567890';" >> /vagrant/vm_build.log 2>&1
mysql -u $USER -p$PASS -e "GRANT ALL PRIVILEGES ON *.* TO 'devopscilsy'@'localhost';" >> /vagrant/vm_build.log 2>&1
mysql -u $USER -p$PASS -e "GRANT ALL PRIVILEGES ON *.* TO 'devopscilsy'@'192.168.100.101';" >> /vagrant/vm_build.log 2>&1
mysql -u $USERNAME -p$PASSWORD -e "CREATE DATABASE dbsosmed" >> /vagrant/vm_build.log 2>&1
cd /home/vagrant/sosial-media/
mysql -u $USERNAME -p$PASSWORD dbsosmed < dump.sql
mysql -u $USERNAME -p$PASSWORD -e "FLUSH PRIVILEGES;" >> /vagrant/vm_build.log 2>&1
echo -e "${G}copy config file for mysql server${NC}"
sudo cp -r /var/sharedfolder/config/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf > /dev/null 2>&1
echo -e "${G}allow port for mysql server${NC}"
# sudo ufw allow from 192.168.100.101 to any port 3306
echo -e "${G}restarting all services${NC}"
sudo systemctl restart mysql
echo -e "${G}provision completed!${NC}"
exit 0
