resource "azurerm_resource_group" "sample-rg" {
  name     = var.rg_name
  location = "Brazil South"
}

resource "azurerm_storage_account" "sample-sa" {
  name                              = var.sa_name
  resource_group_name               = azurerm_resource_group.sample-rg.name
  location                          = azurerm_resource_group.sample-rg.location
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
}

resource "azurerm_storage_account" "sample-bad-sa" {
  name                              = var.sa_name
  resource_group_name               = azurerm_resource_group.sample-rg.name
  location                          = azurerm_resource_group.sample-rg.location
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  infrastructure_encryption_enabled = false
}

resource "azurerm_storage_account" "sample-sa-for-each" {
  for_each = var.sa_config

  name                              = each.value
  location                          = azurerm_resource_group.sample-rg.location
  resource_group_name               = azurerm_resource_group.sample-rg.name
  account_replication_type          = "GRS"
  account_tier                      = each.value
  infrastructure_encryption_enabled = each.value
}