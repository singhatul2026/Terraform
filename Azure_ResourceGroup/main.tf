# This Terraform configuration:
# - Uses the Azure (azurerm) provider with a fixed version to ensure consistent deployments
# - Configures the provider to allow Terraform to interact with Azure services
# - Creates a Resource Group in a specified Azure region
# - Adds metadata (tags) for better organization, ownership tracking, and cost management
# Overall, it sets up a basic Azure Resource Group using Infrastructure as Code.


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name       = "asg-rg-old"
  location   = "West Europe"
  managed_by = "Terraform"
  tags = {
    environment = "prod"
    owner       = "atul_singh"
  }
}
