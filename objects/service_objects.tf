
/*
Custom service objects to hold ports
*/

resource "fortios_firewallservice_custom" "custom_service" {
  for_each   = local.service_objects
  app_service_type = "disable"
  category         = "Custom Apps"
  color            = local.fw_service_obj_color_id
  iprange          = each.value["iprange"]
  name             = each.value["name"]
  protocol         = each.value["protocol"]
  tcp_portrange    = each.value["tcp_portrange"]
  visibility       = "enable"
  comment          = each.value["comment"]
}