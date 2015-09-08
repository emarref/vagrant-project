MYSQL_ROOT_PASSWORD="password"
CONFIG_LOCATION="/var/www/app/config/vm"
PHP_TIMEZONE="UTC"
FRONT_CONTROLLER="app_dev"
PUBLIC_DIR="web"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/var/www", type: "nfs"
  config.ssh.forward_agent = true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "shell", inline: "MYSQL_ROOT_PASSWORD=#{MYSQL_ROOT_PASSWORD} CONFIG_LOCATION=#{CONFIG_LOCATION} PHP_TIMEZONE=#{PHP_TIMEZONE} FRONT_CONTROLLER=#{FRONT_CONTROLLER} PUBLIC_DIR=#{PUBLIC_DIR} /bin/bash #{CONFIG_LOCATION}/bootstrap.sh"
end
