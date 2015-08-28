# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64" # Ubuntu 14.04 LTS
  config.vm.hostname = "starter-kit"
  config.vm.synced_folder ".", "/home/vagrant/starter-kit"
  config.vm.network :forwarded_port,
    host: 8080, guest: 80

  config.vm.provider "virtualbox" do |v|
    v.name = "starter_kit_vm"
  end

  # Install Ansible and from there, use it to provision
  config.vm.provision "shell" do |s|
    s.inline = "apt-get -y install software-properties-common"
    s.inline = "apt-add-repository ppa:ansible/ansible"
    s.inline = "apt-get update"
    s.inline = "apt-get install -y software-properties-common"
    s.inline = "apt-get install -y ansible"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvv"
    ansible.playbook = "provision.yml"
  end
end
