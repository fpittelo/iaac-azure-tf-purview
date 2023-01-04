#
# All variables used on this project
#

# Azure Resource Group Name for the project
variable "rg_name" {
  default     = "iaac-azure-tf-purview"
  type        = string
  description = "Azure Resource Group Name for the project"
}

# Variable defining the resource location
variable "rg_location" {
  default     = "Switzerland North"
  type        = string
  description = "Azure Resource Group location for all items"
}

# Variable for department
variable "vm_dpt_it" {
  type    = string
  default = "IT"
}

# Variable for test environment
variable "vm_env_test" {
  type    = string
  default = "Test"
}

# Variable for owner
variable "vm_owner" {
  type    = string
  default = "Fred"
}

