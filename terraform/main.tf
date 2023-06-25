terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
} 

provider "azurerm" {
  features {}
}

# Definition of the providers, then we run terrafomr init to apply the config

#Let's create our ACR in a separate Resource group as suggested in the Best practices

#1. create the rg using var file
resource "azurerm_resource_group" "rg_acr" {
    name = var.rg_acr
    location = var.location

  
}

#deploy the acr resource on the rg created
resource "azurerm_container_registry" "acr" {
    name = "acrlab"
    resource_group_name = var.rg_acr
    location = var.location
    sku = "Basic"

  
}

#Once the resources are defined lets run tf plan

