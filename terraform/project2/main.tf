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
resource "azurerm_resource_group" "example" {
  name     = "rg-tf-proj2-dev"
  location = "centralus"
}

resource "azurerm_storage_account" "example" {
  name                     = "stp2d${lower(random_id.suffix.hex)}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}