resource "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = "${each.value.name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    # NOTE: No public_ip_address_id is attached to keep VM strictly private
  }

  tags = lookup(each.value, "tags", {})
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = lookup(each.value, "size", "Standard_B1s")
  admin_username                  = lookup(each.value, "admin_username", "azureuser")
  admin_password                  = lookup(each.value, "admin_password", "P@ssw0rd12345!")
  disable_password_authentication = lookup(each.value, "disable_password_authentication", false)
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = lookup(each.value, "os_disk_type", "Standard_LRS")
  }

  source_image_reference {
    publisher = lookup(each.value, "publisher", "Canonical")
    offer     = lookup(each.value, "offer", "0001-com-ubuntu-server-jammy")
    sku       = lookup(each.value, "sku", "22_04-lts")
    version   = lookup(each.value, "vm_version", "latest")
  }

  tags = lookup(each.value, "tags", {})
}
