

data "fortios_system_interface" "corp_vlan" {
  name = "vlan.0050"
}

data "fortios_system_interface" "outside" {
  name = "outside-zone"
}

data "fortios_system_interface" "infa_vlan" {
  name = "vlan.0050"
}

# data "fortios_system_interface" "internal_trunk" {
#   name = "vlan.0050"
# }
