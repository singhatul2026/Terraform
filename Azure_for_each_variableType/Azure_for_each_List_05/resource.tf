
resource "azurerm_resource_group" "asg-rg" {
  for_each = toset(["tfvarsrg1", "tfvarsrg2", "tfvarsrg3", "tfvarsrg4"])
  name     = each.value
  location = "eastus"
}
