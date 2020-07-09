# resource "azurerm_resource_group" "k8s" {
#   name     = var.resource_group_name
#   location = var.location
# }

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                  = "default"
    node_count            = var.agent_count
    vm_size               = "Standard_A2_v2"
    os_disk_size_gb       = 30
    enable_auto_scaling   = true
    max_count             = "4" 
    min_count             = "2" 
  }

  # identity {
  #   type = "SystemAssigned"
  # }


  service_principal {
    client_id     = azuread_service_principal.aks_sp.application_id
    client_secret = random_string.password.result
  }

  # tags {
  #   Environment = "Development"
  # }

  network_profile {
    
    # network_plugin = "azure"
    network_plugin = "kubenet"
    # network_policy = "calico"

    load_balancer_sku  = "Standard"
    load_balancer_profile {
        outbound_ip_address_ids = [ azurerm_public_ip.outboundpip.id ]
    }

  }
   depends_on       = [azurerm_public_ip.outboundpip]
}
