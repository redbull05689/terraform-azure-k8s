# variable "client_id" {}
# variable "client_secret" {}

variable "agent_count" {
  default = 1
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8s"
}

variable cluster_name {
  default = "k8sclusrer"
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
  default = "c23293cc-6bd1-4b0a-bb98-4a4153b85776"
}
# variable "azurerm_client_id" {
#   default = "6b96ec3a-ee1c-4276-aab8-17d3b8f03a1c"
# }
# variable "azurerm_client_secret" {}
variable "azurerm_tenant_id" {
  default = "7f7253b5-58ee-417c-a2de-cbf4941e4a34"
}