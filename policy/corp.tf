
resource "fortios_firewall_policy" "corp_web_access" {
  action             = "accept"
  logtraffic         = "utm"
  name               = "corp.wan.allow.web"
  schedule           = "always"
  nat                = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.wan_interface
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


resource "fortios_firewall_policy" "corp_zoom" {
  action             = "accept"
  logtraffic         = "utm"
  name               = "corp.wan.allow.zoom"
  schedule           = "always"
  nat                = "enable"
  internet_service   = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.wan_interface
  }

  srcaddr {
    name = local.corp_addresses
  }

  srcintf {
    name = local.corp_interface
  }

  internet_service_name {
    name = "Zoom.us-Zoom.Meeting"
  }

}

resource "fortios_firewall_security_policyseq" "corp_web_zoom" {
  policy_src_id         = fortios_firewall_policy.corp_zoom.policyid
  policy_dst_id         = fortios_firewall_policy.corp_web_access.policyid
  alter_position        = "after"
  enable_state_checking = true
}


resource "fortios_firewall_policy" "corp_azsrvbus" {
  action             = "accept"
  logtraffic         = "utm"
  name               = "corp.wan.allow.azservicebus"
  schedule           = "always"
  nat                = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.wan_interface
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

resource "fortios_firewall_policy" "corp_portainer" {
  action             = "accept"
  logtraffic         = "utm"
  name               = "corp.inside.allow.portainer"
  schedule           = "always"
  nat                = "disable"

  dstaddr {
    name = "Portainer"
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
    name = "Portainer"
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

