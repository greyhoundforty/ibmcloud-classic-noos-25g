variable "datacenter" {
  description = "Datacenter for bare metal server"
  type        = string
  default     = "dal10"
}

variable "domain_name" {
  description = "Domain name for bare metal server"
  type        = string
  default     = "rst.com"

}

variable "network_speed" {
  description = "The network speed for the node instance."
  type        = number
  default     = 25000
}

variable "package_key_name" {
  description = "Package key name for bare metal server"
  type        = string
  default     = "DUAL_INTEL_XEON_PROC_CASCADE_LAKE_SCALABLE_FAMILY_12_DRIVES"
}

variable "process_key_name" {
  description = "Processor key name for bare metal server"
  type        = string
  default     = "INTEL_INTEL_XEON_8260_2_40"
}

variable "public_vlan_name" {
  description = "Name of the public VLAN to target"
  type        = string
  default     = "public-dal10-vlan"
}

variable "private_vlan_name" {
  description = "Name of the private VLAN to target"
  type        = string
  default     = "private-dal10-vlan"
}