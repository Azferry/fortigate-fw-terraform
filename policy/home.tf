
resource "fortios_firewall_policy" "home_web" {
  action     = "accept"
  logtraffic = "utm"
  name       = "home.outside.allow.web"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.outside_zone_interface
  }

  srcaddr {
    name = local.home_vlan_addresses
  }

  srcintf {
    name = local.home_vlan
  }

  service {
    name = "Web Access"
  }

  service {
    name = "NTP"
  }

}




resource "fortios_firewall_policy" "pol_nas_home" {
  action     = "accept"
  logtraffic = "utm"
  name       = "home.infa.allow.storinator"
  schedule   = "always"
  nat        = "disable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.infa_vlan
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.home_vlan
  }

  service {
    name = "SYNOLOGY_UI"
  }

  service {
    name = "file share"
  }
}

resource "fortios_firewall_policy" "pol_home_infa_rdp" {
  action     = "accept"
  logtraffic = "utm"
  name       = "home.infa.allow.rdp"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.infa_vlan
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.home_vlan
  }

  service {
    name = "RDP"
  }
}

resource "fortios_firewall_policy" "pol_home_ssh" {
  action     = "accept"
  logtraffic = "utm"
  name       = "home.infa.allow.ssh"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.infa_vlan
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.home_vlan
  }

  service {
    name = "SSH"
  }
}

resource "fortios_firewall_policy" "pol_trunk_ssh" {
  action     = "accept"
  logtraffic = "utm"
  name       = "home.po1.allow.ssh"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.infa_vlan
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.internal_zone_interface
  }

  service {
    name = "SSH"
  }
}
# resource "fortios_firewall_security_policyseq" "corp_web_portainer" {
#   policy_src_id         = fortios_firewall_policy.pol_nas_home.policyid
#   policy_dst_id         = fortios_firewall_policy.home_web.policyid
#   alter_position        = "after"
#   enable_state_checking = true
# }
