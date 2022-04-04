
/*
internal trunk interface
*/

resource "fortios_system_interface" "interface_wan_trunk" {
  name        = "po0"
  type        = "aggregate"
  vdom        = local.vdom
  alias       = "wan-trunk"
  role        = "WAN"
  mode        = "dhcp"
  member {
    interface_name =  "internal3"
  } 
}

resource "fortios_system_interface" "interface_internal_trunk" {
  name        = "po1"
  type        = "aggregate"
  vdom        = local.vdom
  alias       = "internal-trunk"
  role        = "LAN"
  ip          = "192.168.2.1 255.255.255.0"
  allowaccess = local.administrative_nic_access_ipv4
}




/*
Vlan_lan
*/
resource "fortios_system_interface" "vlan_lan" {
  name                  = "vlan.0025"
  type                  = "vlan"
  vdom                  = local.vdom
  alias                 = "main-vlan"
  ip                    = "192.168.25.1 255.255.255.0"
  role                  = "LAN"
  device_identification = "enabled"
  vlanid                = 25
  interface             = fortios_system_interface.interface_internal_trunk.name
  allowaccess           = local.administrative_nic_access_ipv4
  depends_on = [
    fortios_system_interface.interface_internal_trunk
  ]
}

resource "fortios_systemdhcp_server" "vlan_lan_dhcp" {
  interface       = fortios_system_interface.vlan_lan.name
  netmask         = "255.255.255.0"
  status          = "enable"
  ntp_server1     = "192.168.52.22"
  dns_service     = "default"
  default_gateway = "192.168.1.1"
  fosid           = 1

  ip_range {
    end_ip   = "192.168.20.225"
    id       = 1
    start_ip = "192.168.20.25"
  }

  depends_on = [
    fortios_system_interface.interface_internal_trunk
  ]
}

/*
Zones
*/
resource "fortios_system_zone" "internal_zone" {
  intrazone   = "deny"
  name        = "inside-zone"
  description = "Internal network traffic"
  interface {
    interface_name = fortios_system_interface.interface_internal_trunk.name
  }
}


resource "fortios_system_zone" "outside_zone" {
  intrazone   = "deny"
  name        = "outside-zone"
  description = "Wan network traffic"
  interface {
    interface_name = fortios_system_interface.interface_wan_trunk.name
  }
}
