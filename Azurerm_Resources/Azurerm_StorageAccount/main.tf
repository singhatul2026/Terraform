resource "azurerm_resource_group" "asg-rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}

resource "azurerm_storage_account" "asg-stg" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = azurerm_resource_group.asg-rg.name
  location                 = azurerm_resource_group.asg-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}