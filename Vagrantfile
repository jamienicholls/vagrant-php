Vagrant.configure("2") do |config|
  # Use centos 8 box
  config.vm.box = "centos/8"
  config.vm.box_version = "1905.1"
  
  # Hostname
  config.vm.hostname = 'boom.local'
  
  # Forward the port 80 to host
  config.vm.network "forwarded_port", guest: 80, host: 80
  
  # Map host folder to vm
  config.vm.synced_folder "./www/", "/var/www/"
  
  # Provision
  config.vm.provision "shell", inline: <<-SHELL
    # Install httpd
    dnf install httpd
    systemctl enable --now httpd
    firewall-cmd --permanent --add-service=http
    
    # Install MariaDB
    dnf install mariadb-server mariadb
    systemctl enable --now mariadb
    
    # Install php
    dnf install php php-fpm php-mysqlnd php-opcache php-gd php-xml php-mbstring
    systemctl enable --now php-fpm
    
  SHELL
end
