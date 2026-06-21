resource "azurerm_resource_group" "asg_rg" {
  for_each   = var.asg_rg
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}
