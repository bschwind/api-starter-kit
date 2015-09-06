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

  config.vm.provision "ansible" do |ansible|
    ansible.extra_vars = {
      deploy_env: "local"
    }

    ansible.vault_password_file = "deploy/ansible/ansible-vault-password.py"
    ansible.playbook = "deploy/ansible/provision.yml"
  end
end
