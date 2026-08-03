variable "resource_groups" {
  description = "Map of Resource Groups to be created"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}