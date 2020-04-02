Vagrant.configure("2") do |config|
  # Use centos 8 box
  config.vm.box = "centos/8"
  config.vm.box_url = "http://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Vagrant-8.1.1911-20200113.3.x86_64.vagrant-virtualbox.box"
  #config.vm.box_version = "1905.1"
  
  # Hostname
  config.vm.hostname = 'boom.local'
  config.vm.network "private_network", ip: "10.0.1.2"
  
  # Forward the port 80 to host
  config.vm.network "forwarded_port", guest: 80, host: 80
  
  # Custom VBox addons
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["storageattach", :id,
                 "--storagectl", "IDE",
                 "--port", "0", "--device", "1",
                 "--type", "dvddrive",
                 "--medium", "emptydrive"]
  end
  
  # Map host folder to vm
  config.vm.synced_folder "./www/", "/var/www/html"
  
  # Provision
  config.vm.provision :shell, path: "provision.sh"
end
