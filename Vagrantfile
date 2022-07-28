# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "landingp" do |landingp|
	landingp.vm.box = "ubuntu/focal64"
	landingp.vm.hostname = 'poclandingp'
	landingp.vm.box_url = "ubuntu/focal64"
	landingp.vm.network :private_network, ip: "192.168.100.100"
	landingp.vm.synced_folder "./landingp", "/var/sharedfolder", create: true, group: "www-data", owner: "www-data"
	landingp.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--memory", 512]
		v.customize ["modifyvm", :id, "--name", "poclandingp"]
	end
	landingp.vm.provision "shell" do |s|
		s.path = "landingp.sh"
	end
  end
  
  config.vm.define "pesbuk" do |pesbuk|
	pesbuk.vm.box = "ubuntu/focal64"
	pesbuk.vm.hostname = 'pocpesbuk'
	pesbuk.vm.box_url = "ubuntu/focal64"
	pesbuk.vm.network :private_network, ip: "192.168.100.101"
	pesbuk.vm.synced_folder "./pesbuk", "/var/sharedfolder", create: true, group: "www-data", owner: "www-data"
	pesbuk.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--memory", 512]
		v.customize ["modifyvm", :id, "--name", "pocpesbuk"]
	end
	pesbuk.vm.provision "shell" do |s|
		s.path = "pesbuk.sh"
	end
  end
  
  config.vm.define "wordpress" do |wordpress|
	wordpress.vm.box = "ubuntu/focal64"
	wordpress.vm.hostname = 'pocwordpress'
	wordpress.vm.box_url = "ubuntu/focal64"
	wordpress.vm.network :private_network, ip: "192.168.100.102"
	wordpress.vm.synced_folder "./wordpress", "/var/sharedfolder", create: true, group: "www-data", owner: "www-data"
	wordpress.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--memory", 512]
		v.customize ["modifyvm", :id, "--name", "pocwordpress"]
	end
	wordpress.vm.provision "shell" do |s|
		s.path = "wordpress.sh"
	end
  end
  
  config.vm.define "mysqlpesbuk" do |mysqlpesbuk|
	mysqlpesbuk.vm.box = "ubuntu/focal64"
	mysqlpesbuk.vm.hostname = 'pocmysqlpesbuk'
	mysqlpesbuk.vm.box_url = "ubuntu/focal64"
	mysqlpesbuk.vm.network :private_network, ip: "192.168.100.103"
	mysqlpesbuk.vm.synced_folder "./mysqlpesbuk", "/var/sharedfolder", create: true, group: "www-data", owner: "www-data"
	mysqlpesbuk.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--memory", 1024]
		v.customize ["modifyvm", :id, "--name", "pocmysqlpesbuk"]
	end
	mysqlpesbuk.vm.provision "shell" do |s|
		s.path = "mysqlpesbuk.sh"
	end
  end  
  
  config.vm.define "mysqlwordpress" do |mysqlwordpress|
	mysqlwordpress.vm.box = "ubuntu/focal64"
	mysqlwordpress.vm.hostname = 'pocmysqlwordpress'
	mysqlwordpress.vm.box_url = "ubuntu/focal64"
	mysqlwordpress.vm.network :private_network, ip: "192.168.100.104"
	mysqlwordpress.vm.synced_folder "./mysqlwordpress", "/var/sharedfolder", create: true, group: "www-data", owner: "www-data"
	mysqlwordpress.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--memory", 1024]
		v.customize ["modifyvm", :id, "--name", "pocmysqlwordpress"]
	end
	mysqlwordpress.vm.provision "shell" do |s|
		s.path = "mysqlwordpress.sh"
	end
  end    
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

#Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
#end
