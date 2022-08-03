#!/bin/bash
G='\033[0;32m'
NC='\033[0m'

echo -e "${G}starting provision!${NC}"
sudo su
# echo -e "${G}update and upgrade entire system${NC}"
# sudo apt-get -y update > /dev/null 2>&1
# sudo apt-get -y upgrade > /dev/null 2>&1
echo -e "${G}install nginx${NC}"
sudo apt-get -y install nginx > /dev/null 2>&1
echo -e "${G}install git${NC}"
sudo apt-get -y install git > /dev/null 2>&1
# echo -e "${G}install php${NC}"
# sudo apt-get -y install php7.4 > /dev/null 2>&1
# sudo apt-get -y install php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json > /dev/null 2>&1
# echo -e "${G}enable startup for php${NC}"
# systemctl enable php7.4-fpm > /dev/null 2>&1 
echo -e "${G}cloning webapp from repository${NC}"
cd /var/www/html/
git clone https://github.com/rvnaras/sdc-linux-project-landing-page.git > /dev/null 2>&1
# echo -e "${G}copy webapp source code to nginx${NC}"
# sudo mkdir /var/www/html/sdc-linux-project-landing-page > /dev/null 2>&1
# sudo cp -r /home/vagrant/sdc-linux-project-landing-page/* /var/www/html/sdc-linux-project-landing-page > /dev/null 2>&1
echo -e "${G}copy config file for nginx${NC}"
sudo cp -r /var/sharedfolder/config/default /etc/nginx/sites-available/default > /dev/null 2>&1
echo -e "${G}copy config file for hosts${NC}"
sudo cp -r /var/sharedfolder/config/hosts /etc/hosts > /dev/null 2>&1
echo -e "${G}restarting all services${NC}"
service nginx restart /dev/null 2>&1
echo -e "${G}setting up github connection${NC}"
ssh-keygen -t rsa -b 4096 -C "musyaffadli@gmail.com" -P "" -f ~/.ssh/id_rsa > /dev/null 2>&1
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
echo -e "${G}add below rsa to github${NC}"
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com -o "StrictHostKeyChecking no"
echo -e "${G}provision completed!${NC}"
exit 0
