variable "virtual_network_address" {
  type = list(string)
  description = "it is holding list of virtual address"
  default = [ "23.23.23.23/2" ]
}

variable "virtual_network_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    "Env" = "DEV"
    "region" = "us east"
  }
}

variable "vm_info" {
  type = tuple([string,bool])
}

variable "public_tags" {
  type = object({
    Name = string
    APPID = number
  })
}

variable "public_tags_map" {
  type = map(string)
}

variable "security_rules" {
  type = list(object({
    name                       = string
    description                = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    destination_address_prefixes = list(string)
    destination_application_security_group_ids = list(string)
    destination_port_ranges = list(string)
    source_address_prefixes = list(string)
    source_application_security_group_ids = list(string)
    source_port_ranges = list(string)
  }))
}