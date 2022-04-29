
resource "fortios_firewall_policy" "pol_infa_web" {
  action     = "accept"
  logtraffic = "utm"
  name       = "infa.outside.allow.web"
  schedule   = "always"
  nat        = "enable"

  dstaddr { name = "all" }

  dstintf { name = local.outside_zone_interface }

  srcaddr { name = "all" }

  srcintf { name = local.infa_vlan }

  service { name = "Web Access" }
  service { name = "NTP" }
}


resource "fortios_firewall_policy" "pol_infa_pihole" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.infa.allow.pihole"
  schedule   = "always"
  nat        = "enable"

  dstaddr { name = "all" }

  dstintf { name = local.internal_zone_interface }

  srcaddr { name = "all" }

  srcintf { name = local.infa_vlan }

  service { name = "DNS" }
  service { name = "PING" }
}