resource "fortios_firewall_policy" "insidezone_web_access" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.outside.allow.web"
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
    name = local.internal_zone_interface
  }

  service {
    name = "Web Access"
  }

}

resource "fortios_firewall_policy" "pol_inside_o365" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.outside.allow.O365"
  schedule   = "always"
  nat        = "enable"
  internet_service = "enable"

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
    name = local.internal_zone_interface
  }

  internet_service_name {
    name = "Microsoft-Office365"
  }
  internet_service_name {
    name = "Microsoft-Office365.Published"
  }
  internet_service_name {
    name = "Microsoft-Office365.Published.Allow"
  }
  internet_service_name {
    name = "Microsoft-Office365.Published.Optimize"
  }
  internet_service_name {
    name = "Microsoft-Office365.Published.USGOV"
  }

}

resource "fortios_firewall_policy" "pol_dropbox" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.outside.allow.dropbox"
  schedule   = "always"
  nat        = "enable"
  internet_service = "enable"

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
    name = local.internal_zone_interface
  }

  internet_service_name {
    name = "Dropbox-DNS"
  }
  internet_service_name {
    name = "Dropbox-FTP"
  }
  internet_service_name {
    name = "Dropbox-ICMP"
  }
  internet_service_name {
    name = "Dropbox-Other"
  }
  internet_service_name {
    name = "Dropbox-RTMP"
  }
  internet_service_name {
    name = "Dropbox-Inbound_Email"
  }
  internet_service_name {
    name = "Dropbox-Outbound_Email"
  }
  internet_service_name {
    name = "Dropbox-Web"
  }

}


resource "fortios_firewall_policy" "pol_azure" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.outside.allow.azure"
  schedule   = "always"
  nat        = "enable"
  internet_service = "enable"

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
    name = local.internal_zone_interface
  }

  internet_service_name {
    name = "Microsoft-Azure"
  }
  internet_service_name {
    name = "Microsoft-Intune"
  }

}

resource "fortios_firewall_policy" "pol_zoom" {
  action     = "accept"
  logtraffic = "utm"
  name       = "inside.outside.allow.zoom"
  schedule   = "always"
  nat        = "enable"
  internet_service = "enable"

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
    name = local.internal_zone_interface
  }

  internet_service_name {
    name = "Zoom.us-Zoom.Meeting"
  }

}