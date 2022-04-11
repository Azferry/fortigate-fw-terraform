locals {

  # Administrative Access 
  administrative_nic_access_ipv4 = "ping https http ssh snmp fabric"
  default_dns_server1            = var.dns_primary_ipv4
  default_dns_server2            = var.dns_secondary_ipv4
  vdom                           = "root"

  wan_trunk_interfaces = ["internal3"]

  zone_outside_interfaces = ["po0"]
  zone_inside_interfaces  = ["po1"]

  internal_trunk_vlans = {
    iot_lan = {
      name   = "vlan.0075"
      alias  = "iot-vlan"
      ip     = "192.168.75.1 255.255.255.0"
      role   = "lan"
      vlanid = 75
    },
    corp_lan = {
      name   = "vlan.0050"
      alias  = "corp-vlan"
      ip     = "192.168.50.1 255.255.255.0"
      role   = "lan"
      vlanid = 50
    },
    home_lan = {
      name   = "vlan.0025"
      alias  = "home-vlan"
      ip     = "192.168.25.1 255.255.255.0"
      role   = "lan"
      vlanid = 25
    },
    infa_lan = {
      name   = "vlan.0100"
      alias  = "infa-vlan"
      ip     = "192.168.100.1 255.255.255.0"
      role   = "lan"
      vlanid = 100
    },
    mgt_lan = {
      name   = "vlan.0150"
      alias  = "mgt-vlan"
      ip     = "192.168.150.1 255.255.255.0"
      role   = "lan"
      vlanid = 150
    }
  }

  internal_trunk_vlans_dhcp = {
    home_lan_dhcp = {
      interface       = "vlan.0025"
      netmask         = "255.255.255.0"
      dns_service     = "specify"
      dns_server1     = local.default_dns_server1
      dns_server2     = local.default_dns_server2
      default_gateway = "192.168.25.1"
      end_ip          = "192.168.25.225"
      starting_ip     = "192.168.25.25"
      ip_range_id     = 101
      fosid           = 101
    },
    corp_lan_dhcp = {
      interface       = "vlan.0050"
      netmask         = "255.255.255.0"
      dns_service     = "specify"
      dns_server1     = local.default_dns_server1
      dns_server2     = local.default_dns_server2
      default_gateway = "192.168.50.1"
      end_ip          = "192.168.50.225"
      starting_ip     = "192.168.50.25"
      ip_range_id     = 102
      fosid           = 102
    },
    iot_lan_dhcp = {
      interface       = "vlan.0075"
      netmask         = "255.255.255.0"
      dns_service     = "specify"
      dns_server1     = local.default_dns_server1
      dns_server2     = local.default_dns_server2
      default_gateway = "192.168.75.1"
      end_ip          = "192.168.75.225"
      starting_ip     = "192.168.75.25"
      ip_range_id     = 103
      fosid           = 103
    },
    infa_lan_dhcp = {
      interface       = "vlan.0100"
      netmask         = "255.255.255.0"
      dns_service     = "specify"
      dns_server1     = local.default_dns_server1
      dns_server2     = local.default_dns_server2
      default_gateway = "192.168.100.1"
      end_ip          = "192.168.100.225"
      starting_ip     = "192.168.100.25"
      ip_range_id     = 104
      fosid           = 104
    }
  }

}