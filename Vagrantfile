# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64" # Ubuntu 14.04 LTS
  config.vm.hostname = "starter-kit.dev"
  config.vm.synced_folder ".", "/home/vagrant/starter-kit"

  # Uncomment the following line to put your server on the local network
  # This is useful for allowing other devices on the network to connect
  # You'll have to `vagrant up` again
  # config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.33.10"

  # Landrush plugin for a local DNS server
  config.landrush.enabled = true
  config.landrush.tld = 'dev'
  config.landrush.host "starter-kit.dev", "192.168.33.10"

  config.vm.provider "virtualbox" do |v|
    v.name = "starter_kit_vm"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.extra_vars = {
      deploy_env: "local"
    }

    # This line means `vagrant provision` will prompt you to paste
    # in the ansible-vault dev password
    ansible.ask_vault_pass = true

    # If uncommented, the following line will grab the vault password
    # from an environment variable called VAULT_PASSWORD
    # ansible.vault_password_file = "ansible/ansible-vault-password.py"
    ansible.playbook = "deploy/ansible/provision.yml"
  end
end
