
The idea of this undergoing project is to deploy different resources in azure using Terraform and then provide the software through Ansible.
Using the Terraform file the resources that I am deploying are the following:

````
-ACR
-VM ( podman)
-VM (ansible)
-AKS (persistent volume)
````
##Prequisites (windows):
-Az cli configured
-Visual studio (Hasicorp terraform plugin) [optional]
-Terraform
-Azure project
-Podman [optional] to manage the images

1- Once we have installed az cli we just need to run ````az-login```` to login with our Azure account and be able to use it with terraform.

2- Set up terraform the config files can be found in: https://github.com/franroad/azure/tree/main/terraform the file _main.tf_ contains the basic configuration for terraform to work with azure.
Once we have created the main file, we can run ````terraform init ```` in the same folder where terraform is located  fromt the terminal and we are ready to rumble.

3- Run ````terraform plan```` to obtain a summary of the changes that terraform will apply in our project and ````terrafrom apply```` to proceed.

4- if we check our project thriugth the UI we will be able to see that multiple resources have been created

```#0969DA python


````

s
