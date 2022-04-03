
resource "fortios_firewall_policy" "corp_web_access" {
  action     = "accept"
  logtraffic = "utm"
  name       = "corp.outside.allow.web"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.outside_zone_interface
  }

  srcaddr {
    name = local.corp_addresses
  }

  srcintf {
    name = local.corp_interface
  }

  service {
    name = "Web Access"
  }

}

resource "fortios_firewall_policy" "corp_azsrvbus" {
  action     = "accept"
  logtraffic = "utm"
  name       = "corp.outside.allow.azservicebus"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.outside_zone_interface
  }

  srcaddr {
    name = local.corp_addresses
  }

  srcintf {
    name = local.corp_interface
  }

  service {
    name = "AMPQ"
  }

}

resource "fortios_firewall_security_policyseq" "corp_web_azsrvbus" {
  policy_src_id         = fortios_firewall_policy.corp_azsrvbus.policyid
  policy_dst_id         = fortios_firewall_policy.corp_web_access.policyid
  alter_position        = "after"
  enable_state_checking = true
}


## TODO: Cleanup use zones or move to AG
resource "fortios_firewall_policy" "corp_portainer" {
  action     = "accept"
  logtraffic = "utm"
  name       = "corp.inside.allow.portainer"
  schedule   = "always"
  nat        = "disable"

  dstaddr {
    name = "grp-portainer"
  }

  dstintf {
    name = local.inside_interface
  }

  srcaddr {
    name = local.corp_addresses
  }

  srcintf {
    name = local.corp_interface
  }

  service {
    name = "Web Access"
  }
  service {
    name = "PORTAINER"
  }
  service {
    name = "PING"
  }
  service {
    name = "SSH"
  }
}

resource "fortios_firewall_security_policyseq" "corp_web_portainer" {
  policy_src_id         = fortios_firewall_policy.corp_portainer.policyid
  policy_dst_id         = fortios_firewall_policy.corp_web_access.policyid
  alter_position        = "after"
  enable_state_checking = true
}

