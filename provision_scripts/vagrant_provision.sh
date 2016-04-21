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
