resource "azurerm_virtual_network" "aks" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = [var.virtual_network_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

#   tags = local.tags
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.resource_group_name}-aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks.name
  address_prefix       = cidrsubnet(azurerm_virtual_network.aks.address_space.0, 8, 240)
}

resource "azurerm_route_table" "aks" {
  name                = "${var.resource_group_name}-routetable"
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = "default"
    address_prefix         = "10.100.0.0/14"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }
}

resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = azurerm_subnet.aks_subnet.id
  route_table_id = azurerm_route_table.aks.id
}