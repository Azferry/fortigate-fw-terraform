
/*
internal trunk interface
*/
# resource "fortios_system_interface" "interface_wan_trunk" {
#   name  = "po0"
#   type  = "aggregate"
#   vdom  = local.vdom
#   alias = "wan-trunk"
#   role  = "wan"
#   mode  = "dhcp"
#   dynamic "member" {
#     for_each = local.wan_trunk_interfaces
#     content {
#       interface_name = member.value
#     }
#   }
# }

resource "fortios_system_interface" "interface_internal_trunk" {
  name                  = "po1"
  type                  = "aggregate"
  vdom                  = local.vdom
  alias                 = "internal-trunk"
  role                  = "lan"
  ip                    = "192.168.1.1 255.255.255.0"
  allowaccess           = local.administrative_nic_access_ipv4
  device_identification = "enable"
}

resource "fortios_systemdhcp_server" "interface_internal_trunk_dhcp" {
  interface       = fortios_system_interface.interface_internal_trunk.name
  netmask         = "255.255.255.0"
  status          = "enable"
  dns_service     = "specify"
  dns_server1     = "192.168.100.5"
  dns_server2     = "192.168.100.10"
  default_gateway = "192.168.1.1"
  fosid           = 100
  ntp_service     = "default"

  ip_range {
    end_ip   = "192.168.1.254"
    id       = 100
    start_ip = "192.168.1.50"
  }

  depends_on = [
    fortios_system_interface.interface_internal_trunk
  ]
}


/*
internal vlans 
*/
resource "fortios_system_interface" "internal_vlan" {
  for_each              = local.internal_trunk_vlans
  name                  = each.value["name"]
  type                  = "vlan"
  vdom                  = local.vdom
  alias                 = each.value["alias"]
  ip                    = each.value["ip"]
  role                  = each.value["role"]
  device_identification = "enable"
  vlanid                = each.value["vlanid"]
  interface             = fortios_system_interface.interface_internal_trunk.name
  allowaccess           = local.administrative_nic_access_ipv4
  depends_on = [
    fortios_system_interface.interface_internal_trunk
  ]
}

/*
DHCP server for interface connections
*/
resource "fortios_systemdhcp_server" "vlan_lan_dhcp" {
  for_each        = local.internal_trunk_vlans_dhcp
  interface       = each.value["interface"]
  netmask         = each.value["netmask"]
  status          = "enable"
  dns_service     = each.value["dns_service"]
  dns_server1     = each.value["dns_server1"]
  dns_server2     = each.value["dns_server2"]
  default_gateway = each.value["default_gateway"]
  fosid           = each.value["fosid"]
  ntp_service     = "default"

  ip_range {
    end_ip   = each.value["end_ip"]
    id       = each.value["ip_range_id"]
    start_ip = each.value["starting_ip"]
  }

  depends_on = [
    fortios_system_interface.interface_internal_trunk,
    fortios_system_interface.internal_vlan
  ]
}

/*
Interface Zones Groups: Internal and External
*/
resource "fortios_system_zone" "internal_zone" {
  intrazone   = local.intrazone_traffic
  name        = "inside-zone"
  description = "Internal network traffic"
  dynamic "interface" {
    for_each = local.zone_inside_interfaces
    content {
      interface_name = interface.value
    }
  }
  depends_on = [
    fortios_system_interface.interface_internal_trunk
  ]
}

resource "fortios_system_zone" "outside_zone" {
  intrazone   = local.intrazone_traffic
  name        = "outside-zone"
  description = "Wan network traffic outbound to internet"

  dynamic "interface" {
    for_each = local.zone_outside_interfaces
    content {
      interface_name = interface.value
    }
  }

  depends_on = [
  ]
}
