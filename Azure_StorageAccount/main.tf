# This Terraform configuration:
# - Uses the Azure (azurerm) provider with a version constraint (~> 3.0) for controlled upgrades
# - Configures the provider to interact with Azure services
# - Creates a Resource Group with tags for environment and ownership tracking
# - Provisions a Storage Account inside the Resource Group
# - Demonstrates Terraform dependency handling:
#     • Implicit dependency: automatically created by referencing Resource Group attributes
#     • Explicit dependency: can be manually defined using depends_on (shown as commented example)
# Overall, it showcases how Terraform manages resource creation order using dependencies.



terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "asg-rg" { # This code block is an example of a resourceGroup
  name       = "asg-resource-group"
  location   = "eastus"
  managed_by = "Morpheus"
  tags = {
    environment = "asg-dev"
    owner       = "asg-morphteam"
  }
}


resource "azurerm_storage_account" "asg_storage_account" { # This code block is an example of a azurerm_storage_account with Implicit Dependency
  name                     = "asgstorageaccount"
  resource_group_name      = azurerm_resource_group.asg-rg.name
  location                 = azurerm_resource_group.asg-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



# resources "azurerm_storage_account" "asg_storage_account" {                        # This code block is an example of a azurerm_storage_account with Explicit Dependency
#    depends_on               = [azurerm_storage_account.asg_storage_account]
#    name                     = "asgstorage"
#    resource_group_name      = asg-resource-group
#    location                 = eastus
#    account_tier             = "Standard"
#    account_replication_type = "LRS"
# }
