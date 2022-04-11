

/*
Schedule Objects
*/
resource "fortios_firewallschedule_recurring" "schedules_object" {
  for_each   = var.schedule_objects
  color = local.schedule_obj_color_id
  day   = each.value["day"]
  end   = each.value["end"]
  name  = each.value["name"]
  start = each.value["start"]
}
