# variable "client_id" {}
# variable "client_secret" {}

variable "agent_count" {
  default = 2
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8s"
}

variable cluster_name {
  default = "k8scluster"
}

variable acr_name {
  default = "quantorireg"
}


variable resource_group_name {
  default = "quantori"
}

variable location {
  default = "Central US"
}

variable "virtual_network_address_space" {
  default = "10.0.0.0/8"
}


variable "azurerm_subscription_id" {
  default = "XXX"
}
variable "azurerm_client_id" {
  default = "XXX"
}
variable "azurerm_client_secret" {
  default = "XXX" 
}
variable "azurerm_tenant_id" {
  default = "XXX"
}
