data "ibm_network_vlan" "private" {
  name = var.private_vlan_name
}

data "ibm_network_vlan" "public" {
  name = var.public_vlan_name
}
