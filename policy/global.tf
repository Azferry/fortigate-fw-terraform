/*
Hosted DNS - Gives access to all interfaces to dns
*/
resource "fortios_firewall_policy" "pol_gbl_dns" {
  action     = "accept"
  logtraffic = "utm"
  name       = "multi.infa.allow.dns"
  schedule   = "always"
  nat        = "enable"
  comments   = "Internal DNS hosting"

  dstaddr { name = "grp-adds" }

  dstintf { name = local.INFA_VLAN }

  srcaddr { name = "all" }

  srcintf { name = local.INFA_VLAN }
  srcintf { name = local.HOME_VLAN }
  srcintf { name = local.INTERNAL_TRUNK }
  srcintf { name = local.IOT_VLAN }
  srcintf { name = local.CORP_VLAN }

  service { name = "DNS" }
  service { name = "NTP" }
}