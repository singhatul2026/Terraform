# This Terraform configuration:
# - Uses the Azure (azurerm) provider with a fixed version to ensure stable and consistent deployments
# - Authenticates and connects Terraform with Azure services using the provider block
# - Creates a Resource Group to logically organize all Azure resources
# - Provisions a Storage Account within the Resource Group
# - Creates a private Storage Container inside the Storage Account
# - Demonstrates Terraform’s dependency management using implicit dependencies
#   (resources are created in the correct order automatically based on references)
# Overall, it sets up a complete Azure storage infrastructure with proper resource hierarchy and dependencies.


##################################################################################
# TERRAFORM BLOCK : # Defines which provider Terraform should use and its version
##################################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" # Official Azure provider from HashiCorp
      version = "4.70.0"
    }
  }
}

#######################################################################
# PROVIDER BLOCK → Used to authenticate and interact with Azure APIs
#######################################################################

provider "azurerm" {
  features {} # Mandatory block (even if empty)
}


######################################################################
# RESOURCE GROUP → Logical container for all Azure resources  
######################################################################

resource "azurerm_resource_group" "asg_rg" {
  name       = "asg-resource-group" # Name of the Resource Group in Azure
  location   = "eastus"             # Region where resources will be created
  managed_by = "Morpheus"
  tags = {
    environment = "asg-dev"
    owner       = "asg-morphteam"
  }
}



###################################################################################
# STORAGE ACCOUNT (IMPLICIT DEPENDENCY) → Depends automatically on Resource Group 
###################################################################################

resource "azurerm_storage_account" "asg_storage_account" {

  name                     = "asgnewstorage123"                     # Must be globally unique
  resource_group_name      = azurerm_resource_group.asg_rg.name     # ↑ Implicit dependency: RG must exist first
  location                 = azurerm_resource_group.asg_rg.location # ↑ Automatically picks same location as RG
  account_tier             = "Standard"                             # Performance tier
  account_replication_type = "LRS"                                  # Locally Redundant Storage
}



###########################################################################
# STORAGE CONTAINER (IMPLICIT DEPENDENCY)  → Depends on Storage Account
###########################################################################

resource "azurerm_storage_container" "asg_storage_container" {
  name                  = "asg-container"                                  # Container name
  storage_account_name  = azurerm_storage_account.asg_storage_account.name # ↑ Implicit dependency: Storage Account must exist
  container_access_type = "private"                                        #  No public access
}


