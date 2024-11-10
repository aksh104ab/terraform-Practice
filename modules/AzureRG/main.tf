resource "azurerm_resource_group" "practiceRG" {
  name     = var.RGName
  location = var.AzLocation
}