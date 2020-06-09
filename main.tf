provider "azurerm" {
  version = "~> 2.0"
  features {}
  subscription_id = var.azurerm_subscription_id
  # client_id       = var.azurerm_client_id
  # client_secret   = var.azurerm_client_secret
  tenant_id       = var.azurerm_tenant_id
}

provider "azuread" {
  version = "~> 0.7"
  subscription_id = var.azurerm_subscription_id
  # client_id       = var.azurerm_client_id
  # client_secret   = var.azurerm_client_secret
  tenant_id       = var.azurerm_tenant_id
}

data "azurerm_client_config" "current" {}

provider "random" {
  version = "~> 2.2"
}


provider "kubernetes" {
  version                = "~> 1.11"
  host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  username               = azurerm_kubernetes_cluster.k8s.kube_config.0.username
  password               = azurerm_kubernetes_cluster.k8s.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}
