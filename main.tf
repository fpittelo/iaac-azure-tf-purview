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
  name                        = var.purview_name
  resource_group_name         = var.rg_name
  location                    = var.rg_location
  public_network_enabled      = true
  managed_resource_group_name = var.purview_mrg_name
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

##### subscription test      #####

##### List all subscriptions with azurerm_subscriptions #####

data "azurerm_subscriptions" "available" {
}

output "available_subscriptions" {
  value = data.azurerm_subscriptions.available.subscriptions
}

output "first_available_subscription_display_name" {
  value = data.azurerm_subscriptions.available.subscriptions[0].display_name
}

##### access information about an existing Subscription #####

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}