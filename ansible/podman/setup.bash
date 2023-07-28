1-st run the command:


PULL NGINX IMAGE:

 podman pull nginx:latest



# giving a name to the container to then be able to manage it
 podman run -d --name nginx1 acrlabfran.azurecr.io/nginx:casopractico2

 2-nd Enter the container bash:

-  podman exec -it  nginx1 bash 


run the following command to chek the issues:

 podman start --interactive --attach <container name>

docker exec <nginx_container_id> nginx -s reload