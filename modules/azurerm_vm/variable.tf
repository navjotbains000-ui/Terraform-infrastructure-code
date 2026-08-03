variable "vms" {
  description = "Map of Virtual Machines to be created without Public IP"
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    subnet_id                       = string
    size                            = optional(string, "Standard_B1s")
    admin_username                  = optional(string, "azureuser")
    admin_password                  = optional(string, "P@ssw0rd12345!")
    disable_password_authentication = optional(bool, false)
    os_disk_type                    = optional(string, "Standard_LRS")
    publisher                       = optional(string, "Canonical")
    offer                           = optional(string, "0001-com-ubuntu-server-jammy")
    sku                             = optional(string, "22_04-lts")
    vm_version                      = optional(string, "latest")
    tags                            = optional(map(string), {})
  }))
}
