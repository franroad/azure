
The idea of this undergoing project is to deploy different resources in azure using Terraform and then provide the software through Ansible.
In this repo we can find a couple of folders:

````
Terraform:

Ansible:
````
## Prequisites (windows):
-Az cli configured
-Visual studio (Hasicorp terraform plugin) [optional]
-Terraform
-Azure project
-Podman [optional] to manage the images

1- Once we have installed az cli we just need to run ````az-login```` to login with our Azure account and be able to use it with terraform.

2- Set up terraform the config files can be found in: https://github.com/franroad/azure/tree/main/terraform the file _main.tf_ contains the basic configuration for terraform to work with azure.
Once we have created the main file, we can run ````terraform init ```` in the same folder where terraform is located  fromt the terminal and we are ready to rumble.

3- Run ````terraform plan```` to obtain a summary of the changes that terraform will apply in our project and ````terrafrom apply```` to proceed.

4- if we check our project thriugth the UI we will be able to see that multiple resources have been created, let's focus on the ACR.
with podman installed in windows lets follow the nex steps to download a public image, rename it and upload it in a folder called nginx.

Open a power shell terminal:

```#0969DA
podman machine init

podman machine start 

podman pull nginx

> No matter the image in this scenario,by default _latest_

podman image ls
> list the image that we have downloaded, jot down the _REPOSITORY_ and the _TAG_


````
We got the image and we have the name of the repository and the tag it will be useful later.

Now in order to push this image in our ACR we need firs to login hence, we are gonna run the following command

````
podman login <myregistry.azurecr.io> 

> This info can be found in he UI in ACR section in our container

````
We will be asked for our user and pass, this info can be found in the UI, _access keys_ section [1]

[1].https://learn.microsoft.com/en-us/azure/container-registry/media/container-registry-authentication/auth-portal-01.png

Once we are logged we can proceed by renaming/tagging the imaghe and pushing it to our repository.

````
podman tag docker.io/library/nginx:latest <myregistry.azurecr.io>/nginx:casopractico2

> We are using the repository and the tag that we have noted previously for selecting the image and we are ranaming it like: "<myregistry.azurecr.io>/nginx:casopractico2"


podman push acrlabfran.azurecr.io/nginx:casopractico2

>We have pushed the image to the repository.


````
Visually after pushing the image, our repository looks like this:

https://github.com/franroad/azure/issues/1#issue-1781554075





