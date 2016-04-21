#!/bin/bash

# disable firewall
sudo ufw disable

# install rancher
docker run -d --restart=always -p 8080:8080 rancher/server

# create .vimrc file
echo "set nocompatible" >> /home/vagrant/.vimrc
echo ".vimrc created"

# remove vboxguest edition
rm -f /home/vagrant/VBoxGuestAdditions.iso
echo "virtualbox guest addition iso removed ..."

# install rancher-compose
# cd /tmp
# wget -q https://github.com/rancher/rancher-compose/releases/download/v0.7.4/rancher-compose-linux-amd64-v0.7.4.tar.gz
# tar -zxvf rancher-compose-linux-amd64-v0.7.4.tar.gz
# cp ./rancher-compose-v0.7.4/rancher-compose /usr/local/bin/rancher-compose
# rm -r rancher-compose-v0.7.4
# rm rancher-compose-linux-amd64-v0.7.4.tar.gz
