resource "azurerm_resource_group" "asg-rg" {
  for_each   = var.Resource_Groups
  name       = each.value.resource_group_name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags
}