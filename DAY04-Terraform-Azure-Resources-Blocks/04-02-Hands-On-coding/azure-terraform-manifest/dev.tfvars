#virtual_network_address = ["10.0.0.0/16"]
virtual_network_name = "test-network"
tags = {
    "ENV" = "TEST"
    "region" = "ap south"
    "appid" = "alsdjf;lasdfasf"
}

vm_info = ["my-vm-name", false]

public_tags = {
  APPID = 123444
  Name = "PUBLIC_IP"
  ENV = "DEV"
}

public_tags_map = {
   APPID = 123444
  Name = "PUBLIC_IP"
  ENV = "DEV"
}

security_rules = [
    {
    name                       = "allow-ssh"
    description                = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
    destination_address_prefixes = []
    destination_application_security_group_ids = []
    destination_port_ranges = []
    source_address_prefixes = []
    source_application_security_group_ids = []
    source_port_ranges = []
  },

  {
    name                       = "allow-http"
    description                = "allow-http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
    destination_address_prefixes = []
    destination_application_security_group_ids = []
    destination_port_ranges = []
    source_address_prefixes = []
    source_application_security_group_ids = []
    source_port_ranges = []
  },
  {
    name                       = "allow-http"
    description                = "allow-http"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
    destination_address_prefixes = []
    destination_application_security_group_ids = []
    destination_port_ranges = []
    source_address_prefixes = []
    source_application_security_group_ids = []
    source_port_ranges = []
  }
  ]