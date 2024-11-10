/*module "AzureRG" {
  source = "./modules/AzureRG"
  #RGName = "AKS-01"
}
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "AzureSA" {
  source = "./modules/AzureSA"
}
*/


# Create Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "txbackbonehosta-rg"
  location = "East US"
}

# Create Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet1" {
  name                = "txbackbonevnethosta401"
  location           = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
}

# Create Subnet
resource "azurerm_subnet" "subnet1" {
  name                 = "tnsqlnhostaa401"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Storage Account
resource "azurerm_storage_account" "SA1" {
  name                     = "tsfssafar401"  # must be globally unique
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_name" {
  value = azurerm_storage_account.SA1.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet1.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id
}
