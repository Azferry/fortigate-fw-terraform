locals {

  # Wan Interface
  wan_interface = "wan1"

  # Inside Interface 
  inside_interface = "wan2"
  # CORP Network
  corp_addresses = "VLAN_60_CORP address"
  corp_interface = "VLAN_60_CORP"

  # IOT Network
  iot_addresses = ""
  iot_interface = "VLAN_30_IOT"

  # Zones
  internal_zone_interface = "po1"
  outside_zone_interface = "outside-zone"


}