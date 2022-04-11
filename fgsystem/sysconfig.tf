
resource "fortios_system_global" "sysconfig_global" {
  admin_sport     = var.system_admin_https_port
  admin_port      = var.system_admin_http_port
  alias           = var.system_alias
  hostname        = var.system_hostname
  timezone        = var.system_timezone_id
  admin_login_max = 10
  language        = "english"
}


resource "fortios_system_settings" "sysconfig" {
  gui_email_collection    = "disable"
  gui_wireless_controller = "disable"
  gui_switch_controller   = "disable"
  gui_voip_profile        = "disable"
  ngfw_mode               = "profile-based"
}

resource "fortios_system_ntp" "sysntp" {
  ntpsync      = "enable"
  syncinterval = 1 ## In Minutes (1 - 1440)
  type         = "fortiguard"
}


resource "fortios_system_passwordpolicy" "admin_policy" {
  apply_to              = "admin-password"
  min_lower_case_letter = 0
  min_non_alphanumeric  = 0
  min_number            = 0
  min_upper_case_letter = 0
  minimum_length        = 8
  # change_4_characters   = "disable"
  # expire_day            = 90
  # expire_status         = "disable"
  # reuse_password        = "enable"
  # status                = "disable"
}