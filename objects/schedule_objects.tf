

resource "fortios_firewallschedule_recurring" "weekends_allday" {
  color = local.schedule_obj_color_id
  day   = "sunday saturday"
  end   = "00:00"
  name  = "weekend-allday"
  start = "00:00"
}

resource "fortios_firewallschedule_recurring" "weekday_allday" {
  color = local.schedule_obj_color_id
  day   = "monday tuesday wednesday thursday friday "
  end   = "00:00"
  name  = "weekday-allday"
  start = "00:00"
}

resource "fortios_firewallschedule_recurring" "weekday_bizhours" {
  color = local.schedule_obj_color_id
  day   = "monday tuesday wednesday thursday friday "
  end   = "06:00"
  name  = "weekday-bizhours"
  start = "16:00"
}