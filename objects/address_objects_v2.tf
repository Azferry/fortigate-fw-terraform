
resource "fortios_firewall_address" "grp_addr_obj" {
  for_each   = local.address_obj
  color      = local.subnet_obj_color_id
  name       = each.value["name"]
  subnet     = each.value["subnet"]
  type       = "subnet"
  visibility = "enable"
  associated_interface  = each.value["interface"]
}


resource "fortios_firewall_addrgrp" "grp_address_groups" {
  for_each   = local.address_groups
  color      = local.addressgroup_obj_color_id
  exclude    = "disable"
  name       = each.value["name"]
  visibility = "enable"
  type       = "group"
  comment    = each.value["comments"]

  dynamic "member" {
    for_each = each.value["address_objects"]
    content {
      name = member.value
    }
  }

  depends_on = [
    fortios_firewall_address.grp_addr_obj
  ]
}