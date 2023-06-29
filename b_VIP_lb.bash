# create a public IP 
az network public-ip create \
    --resource-group lb-group \
    --name VIP \
    --sku Standard \
    --zone 1

#creamos el lb, se necesita el frontend pool y el backend pool

az network lb create \
    --resource-group lb-group \
    --name myLoadBalancer \
    --sku Standard \
    --public-ip-address VIP \
    --frontend-ip-name myFrontEnd \
    --backend-pool-name myBackEndPool


    #creamos el healthcheck

    az network lb probe create \
    --resource-group lb-group \
    --lb-name myLoadBalancer \
    --name myHealthProbe \
    --protocol tcp \
    --port 80

    #creamos la load balancer rule

    #A load balancer rule defines:

        Frontend IP configuration for the incoming traffic

        The backend IP pool to receive the traffic

        The required source and destination port

    az network lb rule create \
    --resource-group lb-group \
    --lb-name myLoadBalancer \
    --name myHTTPRule \
    --protocol tcp \
    --frontend-port 80 \
    --backend-port 80 \
    --frontend-ip-name myFrontEnd \
    --backend-pool-name myBackEndPool \
    --probe-name myHealthProbe \
    --disable-outbound-snat true \
    --idle-timeout 15 \
    --enable-tcp-reset true


    #añadimos las instancias al backend pool:

    array=(vm-01-lb442_z1 vm_03_cliVMNic
 vm_cli_02VMNic
) 
for vmnic in "${array[@]}"
do
    az network nic ip-config address-pool add \
     --address-pool myBackendPool \
     --ip-config-name ipconfig1 \
     --nic-name $vmnic \
     --resource-group lb-group \
     --lb-name myLoadBalancer
  done


   az network nic ip-config address-pool add \
     --address-pool myBackendPool \
     --ip-config-name ipconfig2 \
     --nic-name vm_cli_02VMNic \
     --resource-group sg_lb_cli \
     --lb-name myLoadBalancer