resource "azuread_application" "aks_sp" {
  name = "sp-aks-${var.cluster_name}"
}

# define the password
resource "random_string" "password" {
  length  = 32
  special = true
}

resource "random_string" "aks_sp_secret" {
  length  = 32
  special = true
}


resource "azuread_service_principal" "aks_sp" {
  application_id               = azuread_application.aks_sp.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "aks_sp" {
  service_principal_id = azuread_service_principal.aks_sp.id
  value                = random_string.password.result
  end_date_relative    = "8760h" # 1 year

  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
}

resource "azuread_application_password" "aks_sp" {
  application_object_id = azuread_application.aks_sp.id
  value                 = random_string.aks_sp_secret.result
  end_date_relative     = "8760h" # 1 year

  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
}

resource "azurerm_role_assignment" "aks_sp_network" {
  scope                = azurerm_virtual_network.aks.id
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.aks_sp.object_id
}

resource "azurerm_role_assignment" "azurerm_public_ip" {
  scope                = azurerm_public_ip.outboundpip.id
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.aks_sp.object_id
}


# resource "azurerm_role_assignment" "azurerm_public_ip2" {
#   scope                = azurerm_public_ip.outbound.id
#   role_definition_name = "Network Contributor"
#   principal_id         = azuread_service_principal.aks_sp.object_id
# }

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
#   tags                = var.tags
}

resource "azurerm_role_assignment" "aks_sp_container_registry" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_service_principal.aks_sp.object_id
}

