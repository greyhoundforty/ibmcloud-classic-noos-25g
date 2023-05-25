


locals {
  prefix = "${random_string.prefix.result}-lab"
  tags = [
    "owner:ryantiffany",
    "provider:ibm",
    "datacenter:${var.datacenter}",
    "deleteme",
    "temporary-testing",
  ]
}

resource "random_string" "prefix" {
  length  = 4
  special = false
  upper   = false
}

resource "ibm_compute_bare_metal" "single_group" {
  package_key_name = var.package_key_name
  process_key_name = var.process_key_name
  memory           = 192
  os_key_name      = "OS_NO_OPERATING_SYSTEM"
  hostname         = "no-os-25"
  domain           = "rst.com"
  datacenter       = var.datacenter
  network_speed    = var.network_speed
  public_bandwidth = 20000
  disk_key_names = [
    "HARD_DRIVE_1_00_TB_SATA_2",
    "HARD_DRIVE_1_00_TB_SATA_2",
    "HARD_DRIVE_7_6TB_NVME_SSD_U_2",
    "HARD_DRIVE_7_6TB_NVME_SSD_U_2",
    "HARD_DRIVE_7_6TB_NVME_SSD_U_2",
    "HARD_DRIVE_7_6TB_NVME_SSD_U_2",
  ]
  redundant_network      = false
  hourly_billing         = false
  private_network_only   = false
  unbonded_network       = true
  public_vlan_id         = data.ibm_network_vlan.public.id
  private_vlan_id        = data.ibm_network_vlan.private.id
  tags                   = local.tags
  redundant_power_supply = true

  storage_groups {
    array_type_id = 2
    hard_drives   = [0, 1]
    array_size    = 960
  }
}