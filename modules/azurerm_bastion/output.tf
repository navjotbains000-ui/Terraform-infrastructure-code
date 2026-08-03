output "bastions" {
  description = "Map of created Azure Bastion hosts details"
  value = {
    for k, v in azurerm_bastion_host.bastion : k => {
      id        = v.id
      name      = v.name
      public_ip = azurerm_public_ip.bastion_pip[k].ip_address
    }
  }
}
