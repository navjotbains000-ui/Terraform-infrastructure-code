resource "azurerm_public_ip" "bastion_pip" {
  for_each = var.bastions

  name                = "${each.value.name}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = lookup(each.value, "tags", {})
}

resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastions

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = lookup(each.value, "sku", "Basic")

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = each.value.subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }

  tags = lookup(each.value, "tags", {})
}
