#!/bin/bash
G='\033[0;32m'
NC='\033[0m'
USERNAME='devopscilsy'
PASSWORD='1234567890'
DBIP='192.168.100.103'

echo -e "${G}starting provision!${NC}"
sudo su
echo -e "${G}update and upgrade entire system${NC}"
sudo apt-get -y update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1
echo -e "${G}install mysql client${NC}"
sudo apt-get -y install mysql-client-core-8.0 > /dev/null 2>&1
echo -e "${G}install nginx${NC}"
sudo apt-get -y install nginx > /dev/null 2>&1
echo -e "${G}install git${NC}"
sudo apt-get -y install git > /dev/null 2>&1
echo -e "${G}install php${NC}"
sudo apt-get -y install php7.4 > /dev/null 2>&1
sudo apt-get -y install php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json > /dev/null 2>&1
echo -e "${G}enable startup for php${NC}"
systemctl enable php7.4-fpm > /dev/null 2>&1 
echo -e "${G}cloning wordpress from repository${NC}"
cd /home/vagrant/
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz > /dev/null 2>&1
echo -e "${G}extracting webapp source code to nginx${NC}"
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html > /dev/null 2>&1
sudo chown -R www-data.www-data /var/www/html/wordpress
echo -e "${G}copy config file for nginx${NC}"
sudo cp -r /var/sharedfolder/config/default /etc/nginx/sites-available/default > /dev/null 2>&1
echo -e "${G}copy config file for hosts${NC}"
sudo cp -r /var/sharedfolder/config/hosts /etc/hosts > /dev/null 2>&1
echo -e "${G}restarting all services${NC}"
service nginx restart /dev/null 2>&1
echo -e "${G}provision completed!${NC}"
exit 0
