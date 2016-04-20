# -*- mode: ruby -*-
# vi: set ft=ruby :

# To enable rsync folder share change to false
# $ip_server="172.19.8.111"
$vb_mem = "4096"
$vb_gui = false

$descriptionString="
vagrant-ubuntu-14.04-rancher 0.9.0 based on Ubuntu 14.04
base image cxtlabs/vagrant-ubuntu-14.04
build for VirtualBox 5.0.18
- docker version 1.11.0
- docker-compose 1.7.0
- rancher 1.0.1
"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "cxtlabs/vagrant-ubuntu-14.04-docker"
  config.vm.box_check_update=true

  # create rancheros instance for rancher
  config.vm.define "ubuntu-14.04-rancher" do |rancher|
    hostname = "ubuntu-14.04-rancher"
    rancher.vm.provider "virtualbox" do |vb|
          vb.name = "vagrant-#{hostname}"
          vb.customize ["modifyvm", :id, "--description", $descriptionString]
          vb.memory = $vb_mem
          vb.gui = $vb_gui
          # set display params
          # vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
          vb.customize ["modifyvm", :id, "--vram", "128"]
    end

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    rancher.vm.network "forwarded_port", guest: 8080, host: 8080
    rancher.vm.network "forwarded_port", guest: 22,  host: 2222, id: "ssh", disabled: true
    rancher.vm.network "forwarded_port", guest: 22,  host: 2201, auto_correct: true
    rancher.vm.hostname = hostname

    # Define ssh configuration
    rancher.ssh.insert_key = false

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    rancher.vm.provision "shell" do |cmd|
      cmd.path = "./provision_scripts/vagrant_provision.sh"
    end

  end

end
