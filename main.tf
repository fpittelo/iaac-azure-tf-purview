#
#
# Main Terraform file for the project
#

resource "azurerm_resource_group" "rg" {
  name                        = var.rg_name
  location                    = var.rg_location

  tags = {
    department                = var.vm_dpt_it
    environment               = var.vm_env_test
    owner                     = var.vm_owner
  }
}

resource "azurerm_purview_account" "iaac_data" {
  name                        = var.purview_name
  resource_group_name         = var.rg_name
  location                    = var.rg_location
  public_network_enabled      = true
  managed_resource_group_name = var.purview_mrg_name
  depends_on                  = [azurerm_resource_group.rg]

  tags = {
    department                = var.vm_dpt_it
    environment               = var.vm_env_test
    owner                     = var.vm_owner
  }

  identity {
#   principal_id              = var.purview_principal_id
#   tenant_id                 = var.tenant_id
    type                      = var.purview_sys_identity
  }
}