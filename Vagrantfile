# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.synced_folder "~/sites", "/home/vagrant/sites"
  config.vm.network :private_network, ip: "192.168.33.10" 
  config.vm.network :forwarded_port, guest: 8000, host: 8888
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "init.pp"
    puppet.module_path = "puppet/modules"
  #  puppet.options = "--verbose --debug"	
  end

end
