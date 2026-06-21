resource "azurerm_resource_group" "env_rg" {
  for_each = var.environments

  name     = "rg-${each.key}"
  location = each.value.location
  tags     = each.value.tags
}