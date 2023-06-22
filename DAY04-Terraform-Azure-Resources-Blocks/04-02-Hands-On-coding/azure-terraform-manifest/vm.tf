# resource "azurerm_managed_disk" "example_disk" {
#   name                 = "acctestmd"
#   location             = azurerm_resource_group.terra_rg.location
#   resource_group_name  = azurerm_resource_group.terra_rg.name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = "1"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_windows_virtual_machine" "windows_vm" {
#   name                = "example-machine"
#   resource_group_name = azurerm_resource_group.terra_rg.name
#   location            = azurerm_resource_group.terra_rg.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   admin_password      = "P@$$w0rd1234!"
#   network_interface_ids = [
#     azurerm_network_interface.example.id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter"
#     version   = "latest"
#   }
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
#   managed_disk_id    = azurerm_managed_disk.example_disk.id
#   virtual_machine_id = azurerm_windows_virtual_machine.windows_vm.id
#   lun                = "10"
#   caching            = "ReadWrite"
# }