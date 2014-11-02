# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "11.16.4"
  config.vm.box = "opscode_ubuntu-14.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  config.vm.network "private_network", ip: "10.100.0.50"
  config.ssh.forward_agent = true
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "."
    chef.add_recipe "stager"
  end
end
