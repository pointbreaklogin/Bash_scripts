#!/bin/bash
#zabbix agent installation script in debian/ubantu/mint
echo "Zabbix Agent installation "
echo "Installation in 3 seconds>>>>>>"
sleep 2
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
echo ""
echo "Updation in Progress..........Dont EXIT"
echo ""
#updating os
apt update -y && apt upgrade -y
#installing zabbix
apt install zabbix-agent -y
systemctl enable --now zabbix-agent
#editing zabbix configuration file
sed -i 's/Server=127.0.0.1/Server=172.16.50.51/g' /etc/zabbix/zabbix_agentd.conf
#restarting zabbix
systemctl restart zabbix-agent
echo""
echo "Zabbix Installation completed"
echo ""
systemctl disable --now ufw.service
echo "firewall disabled"
echo ""
echo "installing ssh"
#optional- installing ssh
apt-get install openssh-server -y
echo "______Doing stuff_______"
echo "your ip address : $(hostname -I)"