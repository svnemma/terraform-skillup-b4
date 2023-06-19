resource "azurerm_windows_virtual_machine" "terra-win-vm" {
  resource_group_name = azurerm_resource_group.terra-rg-01.name
  name = "terra-vm-01"
  location = azurerm_resource_group.terra-rg-01.location
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer  = "WindowsServer"
    sku  = "2008-R2-SP1"
    version = "latest"
  }
  size = "Standard_D2s_v3"
  admin_username = "adminUsername"
  admin_password = "Pasdlj9873945lkmsg45y"
  network_interface_ids = [azurerm_network_interface.name.id]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}



resource "azurerm_managed_disk" "example" {
  name                 = "acctestmd"
  location             = azurerm_resource_group.terra-rg-01.location
  resource_group_name  = azurerm_resource_group.terra-rg-01.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "example-dd" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_windows_virtual_machine.terra-win-vm.id
  lun                = "10"
  caching            = "ReadWrite"
}