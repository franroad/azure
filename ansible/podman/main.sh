#!/usr/bin/env python3
sudo apt update
apt install -y apache2-utils

apt install -y openssl

#Create the certificate using ssl
mkdir frankyssl && cd frankyssl

openssl req -x509 -newkey rsa:4096 -keyout franky.pem -out frankycert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

#setup nginx acces
#1-generate the user

  mkdir -p /etc/apache2/ | htpasswd -c /etc/apache2/.htpasswd franky
  yes
  yes

  

# in the following directory
/etc/nginx/conf.d# nano default.conf
# add the following config: in the server section (defualt-conf file)


#afrter appleying the changes restart nginx:

nginx -s reload
nginx -t check the files.
#let's do a commit with these changes:

    
    podman commit <imageid> acrlabfran.azurecr.io/nginx:casopractico2.1
    
#pULL image from our repo
podman pull acrlabfran.azurecr.io/nginx:<tag>


podman push acrlabfran.azurecr.io/nginx:casopractico2

podman login acrlabfran.azurecr.io