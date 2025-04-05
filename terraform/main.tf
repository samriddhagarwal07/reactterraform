provider "azurerm" {
  features {}
subscription_id = "4a6f3be4-14cd-451b-97b0-d315131d91cd"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "appservice-plan"
  location            = "eastus"
  resource_group_name = "react-rg"
  os_type             = "Windows"
  sku_name            = "F1"

  }


resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    always_on = false
  }
}
