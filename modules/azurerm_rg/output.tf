output "resource_groups" {
  description = "Map of created Resource Groups details"
  value       = { for k, v in azurerm_resource_group.rg : k => { id = v.id, name = v.name, location = v.location } }
}
