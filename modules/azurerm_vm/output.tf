output "vms" {
  description = "Map of created private Virtual Machines details"
  value = {
    for k, v in azurerm_linux_virtual_machine.vm : k => {
      id         = v.id
      name       = v.name
      private_ip = azurerm_network_interface.nic[k].private_ip_address
    }
  }
}
