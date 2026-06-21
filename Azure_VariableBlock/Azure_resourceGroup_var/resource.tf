#  RG
resource "azurerm_resource_group" "asg-rg" {
  name     = var.azure_rg
  location = "eastus"
}

  location                 = azurerm_resource_group.asg-rg.location
  resource_group_name      = azurerm_resource_group.asg-rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}