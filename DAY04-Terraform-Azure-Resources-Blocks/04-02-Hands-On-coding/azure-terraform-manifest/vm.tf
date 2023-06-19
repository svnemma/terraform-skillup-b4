resource "azurerm_linux_virtual_machine" "linux_vm" {
  name = var.vm_info[0]
  resource_group_name = azurerm_resource_group.terra_rg_01.name
  location = azurerm_network_security_group.nsg_01.location
  size = "Standard_F2"
  admin_username = "suresh"
  admin_password = "asdfasfd9876asdfasdf@i7w4"
  disable_password_authentication = var.vm_info[1]
  network_interface_ids = [azurerm_network_interface.terra-nw-interface.id]
  os_disk{
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference{
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

}

# resource "azurerm_managed_disk" "name" {
  
#   name                 = "acctestmd"
#   location             = azurerm_resource_group.terra_rg_01.location
#   resource_group_name  = azurerm_resource_group.terra_rg_01.name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = "10"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "example" {
#   managed_disk_id    = azurerm_managed_disk.name.id
#   virtual_machine_id = azurerm_windows_virtual_machine.windows_vm.id
#   lun                = "10"
#   caching            = "ReadWrite"
# }