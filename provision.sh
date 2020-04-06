    # Install httpd
    dnf install httpd -y
    systemctl enable --now httpd
    firewall-cmd --permanent --add-service=http
    
    # Install MariaDB
    dnf install mariadb-server mariadb -y
    systemctl enable --now mariadb
    
    # Install php
    dnf install php php-fpm php-mysqlnd php-opcache php-gd php-xml php-mbstring php-json -y
    systemctl enable --now php-fpm
