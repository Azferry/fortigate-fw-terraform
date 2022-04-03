
resource "fortios_firewall_policy" "iot_all" {
  action     = "accept"
  logtraffic = "utm"
  name       = "iot.outside.allow.all"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.outside_zone_interface
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.iot_interface
  }

  service {
    name = "ALL"
  }
}

# resource "fortios_firewall_security_policyseq" "corp_web_portainer" {
#   policy_src_id         = fortios_firewall_policy.corp_portainer.policyid
#   policy_dst_id         = fortios_firewall_policy.corp_web_access.policyid
#   alter_position        = "after"
#   enable_state_checking = true
# }
