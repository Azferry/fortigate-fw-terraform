terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.14.0"
    }
  }
}

provider "fortios" {
  hostname = "192.168.1.1"
  token    = ""
  insecure = "true"
}


resource "fortios_firewall_policy" "trname" {
  action             = "accept"
  logtraffic         = "utm"
  name               = "LAN-WAN"
  schedule           = "always"
  nat                = "enable"

  dstaddr {
    name = "all"
  }

  dstintf {
    name = "wan1"
  }

  srcaddr {
    name = "VLAN_20_LAN address"
  }

  srcintf {
    name = "internal3"
  }


  service {
    name = "HTTP"
  }
  service {
    name = "HTTPS"
  }
  service {
    name = "DNS"
  }

}