resource "azurerm_resource_group" "terra-rg-01" {
  name = "terraform-rg-01"
  location = "eastus"

  tags = {
    "Environment" = "DEV"
  }
}

resource "azurerm_virtual_network" "terra-vnet" {
  resource_group_name = azurerm_resource_group.terra-rg-01.name
  name = "terra-vnet"
    location = azurerm_resource_group.terra-rg-01.location
    address_space = ["10.0.0.0/16" ]
}

resource "azurerm_subnet" "terra-subnet" {
  name = "terra-subnet"
  resource_group_name = azurerm_resource_group.terra-rg-01.name
  virtual_network_name = azurerm_virtual_network.terra-vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "name" {
  name = "terra-nw-interface"
  resource_group_name = azurerm_resource_group.terra-rg-01.name
  location = azurerm_resource_group.terra-rg-01.location
  ip_configuration {
    name = "interal"
    subnet_id = azurerm_subnet.terra-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "terra-nsg" {
  name = "terra-nsg"
  resource_group_name = azurerm_resource_group.terra-rg-01.name
  location = azurerm_resource_group.terra-rg-01.location
  security_rule {
    name = "inbound-1"
    description = "test"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    access = "Allow"
    priority = 100
    direction = "Inbound"

  }

}

resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id = azurerm_network_interface.name.id
  network_security_group_id = azurerm_network_security_group.terra-nsg.id
}

