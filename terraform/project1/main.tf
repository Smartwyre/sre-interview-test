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
  name     = "rg-p1-de-${lower(random_id.suffix.hex)}" # name: azure resource type (2 chars)-project1 (2 chars)-environment (2 char)-suffix
  location = "centralus"
}

resource "azurerm_storage_account" "dev" {
  name                     = "stp1de${lower(random_id.suffix.hex)}" # name: azure resource type (2 chars)-project1 (2 chars)-environment (2 char)-suffix
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# staging resources
resource "azurerm_resource_group" "staging" {
  name     = "rg-p1-st-${lower(random_id.suffix.hex)}"
  location = "centralus"
}

resource "azurerm_storage_account" "staging" {
  name                     = "stp1st${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.staging.name
  location                 = azurerm_resource_group.staging.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# prod resources
resource "azurerm_resource_group" "prod" {
  name     = "rg-p1-pr-${lower(random_id.suffix.hex)}"
  location = "centralus"
}

resource "azurerm_storage_account" "prod" {
  name                     = "stp1pr${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
