/*
Local User group 
*/
resource "fortios_user_group" "local_usr_grp" {
  group_type         = "firewall"
  name               = "local-usr-vpn-grp"

  member {
    name = "guest"
  }
}

resource "fortios_user_group" "ldap_usr_grp" {
  group_type         = "firewall"
  name               = "ldap-usr-vpn-grp"

  # member {
  #   name = "guest"
  # }
}
