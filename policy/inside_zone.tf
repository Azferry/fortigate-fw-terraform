resource "fortios_firewall_policy" "insidezone_web_access" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.wan.allow.web"
  schedule   = "always"
  nat        = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = local.wan_interface
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = local.internal_zone_interface
  }

  service {
    name = "Web Access"
  }

}
