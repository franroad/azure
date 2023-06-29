# crear maquina virtual
az vm create   
--name vm_03_cli 
--image Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest 
--admin-username azureuser 
--ssh-key-value /home/francisco/pub  #llave que esta en el cli
--resource-group lb-group 
--nsg sg_lb_cli 
--size Standard_B1s 
--public-ip-address "" 



# inyectar script:

az vm run-command invoke \
--resource-group lb-group \
-n vm_03_cli \
--command-id RunShellScript \
--scripts @nginx \


#sript:

#!/usr/bin/env bash
sudo apt-get -y update
sudo apt-get -y install nginx
echo 'Esta es la 3ra vm' | sudo tee /var/www/html/index.html
sudo service nginx start




az vm run-command invoke --resource-group lb-group -n vm_03_cli --command-id RunShellScript --scripts @restart_nginx
