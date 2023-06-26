# Definition of the providers, then we run terrafomr init to apply the config

#Let's create our ACR in a separate Resource group as suggested in the Best practices

#1. create the rg using var file
resource "azurerm_resource_group" "rg_acr" {
    name = var.rg_acr
    location = var.location

  
}

#deploy the acr resource on the rg created with the admin enabled
resource "azurerm_container_registry" "acr" {
    name = "acrlabfran"
    resource_group_name = var.rg_acr
    location = var.location
    sku = "Basic"
    #add the following option to allow the login with user and pass
    admin_enabled = true

  
}

#create the vnet and the subnets and rg

# we will use the following rg for all the future deployments
resource "azurerm_resource_group" "rg_compute" {
  name = var.rg_compute
  location = var.location
  
}

#We will use the following vnet for furutre deployments
resource "azurerm_virtual_network" "vnet_prac2" {
  name = var.vnet
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.rg_compute
  
}

#will use the following subnet for further deployments
resource "azurerm_subnet" "subnet_prac2" {
  name = var.subnet
  resource_group_name = var.rg_compute
  virtual_network_name = var.vnet
  address_prefixes =["10.0.1.0/24"]
  
  
}

#create a nsg to manage the connectivity of the resources
resource "azurerm_network_security_group" "prac2_nsg" {
  name = var.nsg
  location = var.location
  resource_group_name = var.rg_compute
  
}








#Once the resources are defined lets run tf plan and then terraform apply