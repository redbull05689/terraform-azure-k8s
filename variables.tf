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
