terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion  = false
    }
  }
  alias = "delete_vm_disk"

}