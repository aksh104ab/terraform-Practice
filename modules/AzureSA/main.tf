resource "azurerm_resource_group" "practiceRG" {
  name     = var.RGName
  location = var.AzLocation
}

resource "azurerm_storage_account" "PracticeSA" {
    name                = var.SAName
    resource_group_name = azurerm_resource_group.practiceRG.name
    location            = azurerm_resource_group.practiceRG.location
    account_tier        = var.SATire
    account_replication_type = var.SAReplicationT
    #allow_blob_public_access = true
}

resource "azurerm_storage_container" "PracticeSACn" {
  name                  = var.SAContainerNm
  storage_account_name  = azurerm_storage_account.PracticeSA.name
  container_access_type = var.SAContAccessTyp
}