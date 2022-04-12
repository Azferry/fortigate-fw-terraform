
/*
Custom service objects to hold ports
*/

resource "fortios_firewallservice_custom" "custom_service" {
  for_each   = var.service_objects
  app_service_type = "disable"
  category         = "Custom Apps"
  color            = local.fw_service_obj_color_id
  iprange          = each.value["iprange"]
  name             = each.value["name"]
  protocol         = each.value["protocol"]
  tcp_portrange    = each.value["tcp_portrange"]
  udp_portrange    = each.value["udp_portrange"]
  visibility       = "enable"
  comment          = each.value["comment"]
}

resource "fortios_firewallservice_group" "service_group" {
  for_each = local.service_obj_groups
  color = local.fw_service_obj_group_color_id
  name  = each.value["name"]
  proxy = each.value["proxy"]
  comment = each.value["comment"]

  dynamic member {
    for_each = each.value["member_srv"]
    content {
      name = member.value
    }
  }
  depends_on = [
    fortios_firewallservice_custom.custom_service
  ]
}