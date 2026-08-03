output "vnets" {
  description = "Map of created Virtual Networks details"
  value       = { for k, v in azurerm_virtual_network.vnet : k => { id = v.id, name = v.name, address_space = v.address_space } }
}
