resource "azurerm_resource_group" "terra_rg" {
  location = "eastus"
  name = "terrafrom_resource_rg_01"
  tags = {
    Name = "team"
    Environment = "DEV"
  }
}   

resource "azurerm_subnet" "name" {
  name = "terrasubnet"
  resource_group_name = azurerm_resource_group.terra_rg.name
  virtual_network_name = azurerm_virtual_network.terra_vm_network.name
  address_prefixes = [ "10.0.1.0/24" ]
}

resource "azurerm_virtual_network" "terra_vm_network" {
  name = "terra_vm_network_01"
  resource_group_name = azurerm_resource_group.terra_rg.name
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.terra_rg.location
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.terra_rg.location
  resource_group_name = azurerm_resource_group.terra_rg.name

  ip_configuration {
    name = "sur-01"
    subnet_id = azurerm_subnet.name.id
    private_ip_address_allocation = "Dynamic"
    primary = true
  }


}

resource "azurerm_network_security_group" "terra_nsg" {
    name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.terra_rg.location
  resource_group_name = azurerm_resource_group.terra_rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

 security_rule {
    name                       = "xyz"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
  
}

resource "azurerm_subnet_network_security_group_association" "nsg_attach" {
  network_security_group_id = azurerm_network_security_group.terra_nsg.id
  subnet_id = azurerm_subnet.name.id
}