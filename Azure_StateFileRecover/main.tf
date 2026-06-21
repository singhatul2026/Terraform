terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {                                 # Optional: Remote backend for storing Terraform state in Azure
    resource_group_name  = "b18g94Common"             # Resource group where storage exists
    storage_account_name = "b18g94storage"            # Storage account name (must be globally unique)
    container_name       = "b18g94container"          # Container inside storage account
    key                  = "b18g94.terraform.tfstate" # Name of tfstate file
  }
}


provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "asg-rg" { # This code block is an example of a resourceGroup
  name       = "asg-resource-group"
  location   = "eastus"
  managed_by = "Terraform"
}

# resource "azurerm_resource_group" "asg-rg2" { # This code block is an example of a resourceGroup
#   name     = "asg-resource-group-2"
#   location = "eastus"
#}