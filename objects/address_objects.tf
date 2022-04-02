


resource "fortios_firewall_address" "grp_unificontroller" {
  color                = 3
  name                 = "grp-unificontroller"
  subnet               = "192.168.1.10 255.255.255.255"
  type                 = "subnet"
  visibility           = "enable"
  interface            = "any"
}

resource "fortios_firewall_address" "grp_pihole" {
  color                = 3
  name                 = "grp-pihole"
  subnet               = "192.168.1.53 255.255.255.255"
  type                 = "subnet"
  visibility           = "enable"
  interface            = "any"
}

resource "fortios_firewall_address" "grp_portainer" {
  color                = 3
  name                 = "grp-portainer"
  subnet               = "192.168.1.53 255.255.255.255"
  type                 = "subnet"
  visibility           = "enable"
  interface            = "any"
}

resource "fortios_firewall_address" "grp_hue" {
  color                = 3
  name                 = "grp-huecontroller"
  subnet               = "192.168.30.3 255.255.255.255"
  type                 = "subnet"
  visibility           = "enable"
  interface            = "VLAN_30_IOT"
}


resource "fortios_firewall_addrgrp" "grp_iotdevices" {
  # allow_routing = "disable"
  color         = 4
  exclude       = "disable"
  name          = "grp-iotdevices"
  visibility    = "enable"
  comment = "all iot devices with fixed addresses"

  member {
    name = fortios_firewall_address.grp_hue.name
  }
}

resource "fortios_firewall_addrgrp" "grp_infaservices" {
  # allow_routing = "disable"
  color         = 4
  exclude       = "disable"
  name          = "grp-infasharedservics"
  visibility    = "enable"
  comment = "Internal infa shared services"

  member {
    name = fortios_firewall_address.grp_portainer.name
  }
  member {
    name = fortios_firewall_address.grp_pihole.name
  }
  member {
    name = fortios_firewall_address.grp_unificontroller.name
  }
}