# outputs.tf

# ─────────────────────────────────────────
# Resource Group Outputs
# ─────────────────────────────────────────
output "resource_group_names" {
  description = "Sabhi RG names"
  value       = { for k, v in azurerm_resource_group.asg_rg : k => v.name }
}

output "resource_group_locations" {
  description = "Sabhi RG locations"
  value       = { for k, v in azurerm_resource_group.asg_rg : k => v.location }
}

# ─────────────────────────────────────────
# VNet Outputs
# ─────────────────────────────────────────
output "vnet_ids" {
  description = "Sabhi VNet IDs"
  value       = { for k, v in azurerm_virtual_network.asg_vnet : k => v.id }
}

output "vnet_names" {
  description = "Sabhi VNet names"
  value       = { for k, v in azurerm_virtual_network.asg_vnet : k => v.name }
}

output "vnet_address_spaces" {
  description = "Sabhi VNet address spaces"
  value       = { for k, v in azurerm_virtual_network.asg_vnet : k => v.address_space }
}

# ─────────────────────────────────────────
# Combined — Ek saath sab dekho
# ─────────────────────────────────────────
output "vnet_summary" {
  description = "VNet ka full summary"
  value = {
    for k, v in azurerm_virtual_network.asg_vnet : k => {
      name          = v.name
      id            = v.id
      address_space = v.address_space
      location      = v.location
      rg_name       = v.resource_group_name
    }
  }
}