locals {

  # Wan Interface
  wan_interface = "wan1"

  # Inside Interface 
  inside_interface = "wan2"
  # CORP Network
  corp_addresses = "all"
  corp_interface = "vlan.0050"

  # IOT Network
  iot_addresses = ""
  iot_interface = "vlan.0075"

  # CORP_VNAL
  corp_vlan_addresses = ""
  corp_vlan = "vlan.0050"

  # Zones
  internal_zone_interface = "po1"
  outside_zone_interface = "outside-zone"

  ### HOME ###
  home_vlan_addresses = ""
  home_vlan = "vlan.0025"

  ### INFA ###
  infa_vlan_addresses = ""
  infa_vlan = "vlan.0100"
}