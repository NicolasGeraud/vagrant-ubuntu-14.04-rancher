#!/bin/bash

# Installing vagrant keys
sudo mkdir -pm 700 /home/vagrant/.ssh
sudo wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant /home/vagrant/.ssh

# zero out the disk
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
