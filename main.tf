#
#
# Main Terraform file for the project
#

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location

  tags = {
    department  = var.vm_dpt_it
    environment = var.vm_env_test
    owner       = var.vm_owner
  }
}

resource "azurerm_purview_account" "iaac_data" {
  name                        = "iaac-data"
  resource_group_name         = var.rg_name
  location                    = var.rg_location
  public_network_enabled      = true
  managed_resource_group_name = "iaac-purview-mrgc"
  depends_on                  = [azurerm_resource_group.rg]

  tags = {
    department  = var.vm_dpt_it
    environment = var.vm_env_test
    owner       = var.vm_owner
  }

  identity {
    type = "SystemAssigned"
  }
}