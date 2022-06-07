terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.79.1,  < 3.0.0"
    }
  }

  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

resource "random_id" "suffix" {
  byte_length = 4
}

# dev resources
resource "azurerm_resource_group" "dev" {
  name     = "rg-tf-proj1-dev"
  location = "centralus"
}

resource "azurerm_storage_account" "dev" {
  name                     = "stp1d${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# staging resources
resource "azurerm_resource_group" "staging" {
  name     = "rg-tf-proj1-staging"
  location = "centralus"
}

resource "azurerm_storage_account" "staging" {
  name                     = "stp1s${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.staging.name
  location                 = azurerm_resource_group.staging.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# prod resources
resource "azurerm_resource_group" "prod" {
  name     = "rg-tf-proj1-prod"
  location = "centralus"
}

resource "azurerm_storage_account" "prod" {
  name                     = "stp1p${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
