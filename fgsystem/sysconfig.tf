
resource "fortios_system_global" "trname" {
  admin_sport = 443
  admin_port = 80
  alias       = "FG80F"
  hostname    = "FG80F"
  timezone    = "12"
  admin_login_max = 10
  language = "english"
}


resource "fortios_system_settings" "sysconfig" {
  gui_email_collection = "disable"
  gui_wireless_controller = "disable"
  gui_switch_controller = "disable"
  gui_voip_profile = "disable"
  ngfw_mode = "profile-based"
  
}

resource "fortios_system_ntp" "sysntp" {
  ntpsync      = "enable"
  syncinterval = 1 ## In Minutes (1 - 1440)
  type         = "fortiguard"
}

