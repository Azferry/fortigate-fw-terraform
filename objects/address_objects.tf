/*
IOT services
*/

resource "fortios_firewall_address" "grp_addr_iot" {
  for_each   = var.address_iot_groups
  color      = local.subnet_obj_color_id
  name       = each.value["name"]
  subnet     = each.value["subnet"]
  type       = "subnet"
  visibility = "enable"
  associated_interface  = each.value["interface"]
}

resource "fortios_firewall_addrgrp" "grp_iot_devices" {
  color      = local.addressgroup_obj_color_id
  exclude    = "disable"
  name       = "grp-iot-devices"
  visibility = "enable"
  type       = "group"
  comment    = "Shared infastructure services for policy"

  dynamic "member" {
    for_each = var.address_iot_groups
    content {
      name = member.value["name"]
    }
  }

  depends_on = [
    fortios_firewall_address.grp_addr_iot
  ]
}

/*
Infasturcture shared services
*/

resource "fortios_firewall_address" "grp_addr_sharedservices" {
  for_each   = var.address_grp_shared_srv
  color      = local.subnet_obj_color_id
  name       = each.value["name"]
  subnet     = each.value["subnet"]
  type       = "subnet"
  visibility = "enable"
  associated_interface  = each.value["interface"]
}
resource "fortios_firewall_addrgrp" "grp_sharedservices" {
  color      = local.addressgroup_obj_color_id
  exclude    = "disable"
  name       = "grp-shared-services"
  visibility = "enable"
  type       = "group"
  comment    = "Shared infastructure services for policy"

  dynamic "member" {
    for_each = var.address_grp_shared_srv
    content {
      name = member.value["name"]
    }
  }

  depends_on = [
    fortios_firewall_address.grp_addr_sharedservices
  ]
}

/*
Geo Regions Address Objects for use in policy
https://www.iban.com/country-codes
*/
resource "fortios_firewall_address" "geo_region_address" {
  for_each   = var.geo_locations
  color      = local.geolocation_obj_color_id
  country    = each.value["country"]
  name       = each.value["name"]
  type       = "geography"
  visibility = "enable"
}

resource "fortios_firewall_addrgrp" "folder_georegions" {
  color      = local.geolocation_obj_color_id
  exclude    = "disable"
  name       = "fol-geographic-regions"
  visibility = "enable"
  type       = "folder"
  comment    = "Geolocations for policy"

  dynamic "member" {
    for_each = var.geo_locations
    content {
      name = member.value["name"]
    }
  }

  depends_on = [
    fortios_firewall_address.geo_region_address
  ]
}