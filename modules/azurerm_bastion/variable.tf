variable "bastions" {
  description = "Map of Azure Bastion Hosts to be created"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = string # Must be the ID of AzureBastionSubnet
    sku                 = optional(string, "Basic")
    tags                = optional(map(string), {})
  }))
}
