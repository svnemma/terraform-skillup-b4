

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
    provider = azurerm.delete_vm_disk
  name                  = "terraform-vm-delete-disk"
  location              = "eastus"
  resource_group_name   = "terraform-rg-01"
  network_interface_ids = ["/subscriptions/f154a823-7b49-4f69-a16a-5caf74c6b35a/resourceGroups/terraform-rg-01/providers/Microsoft.Network/networkInterfaces/terra-nw-interface"]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  #   boot_diagnostics {
  #     storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  #   }
}


resource "azurerm_linux_virtual_machine" "my_terraform_vm_default" {
  name                  = "terraform-vm-default"
  location              = "eastus"
  resource_group_name   = "terraform-rg-01"
  network_interface_ids = ["/subscriptions/f154a823-7b49-4f69-a16a-5caf74c6b35a/resourceGroups/terraform-rg-01/providers/Microsoft.Network/networkInterfaces/nw-02"]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk-default"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  #   boot_diagnostics {
  #     storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  #   }
}



# output "public_ip_address" {
#   value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
# }

# output "tls_private_key" {
#   value     = tls_private_key.example_ssh.private_key_pem
#   sensitive = true
# }