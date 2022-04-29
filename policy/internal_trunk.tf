

resource "fortios_firewall_policy" "pol_trunk_ntp" {
  action     = "accept"
  logtraffic = "utm"
  name       = "po1.outside.allow.ntp"
  schedule   = "always"
  nat        = "enable"

  dstaddr { name = "all" }

  dstintf { name = local.outside_zone_interface }

  srcaddr { name = "all" }

  srcintf { name = local.internal_zone_interface }

  service { name = "NTP" }
}