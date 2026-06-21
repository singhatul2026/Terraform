resource "azurerm_resource_group" "asg-rg" {
  for_each   = var.resource_group
  name       = each.value.rgname
  location   = each.value.rglocation
  managed_by = each.value.managed_by
  tags       = each.value.Tag
}

resource "azurerm_storage_account" "asg-stg" {
  for_each                 = var.resource_group
  name                     = each.value.storage.storage_name
  resource_group_name      = azurerm_resource_group.asg-rg[each.key].name
  location                 = azurerm_resource_group.asg-rg[each.key].location
  account_tier             = each.value.storage.account_tier
  account_replication_type = each.value.storage.replication
  tags                     = each.value.Tag
}