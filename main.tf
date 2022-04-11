terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.14.0"
    }
  }

  backend "azurerm" {}

}

provider "fortios" {
  hostname = "192.168.1.1"
  insecure = "true"
}

module "fw_system" {
  source             = "./fgsystem"
  dns_primary_ipv4   = var.dns_primary_ipv4
  dns_secondary_ipv4 = var.dns_secondary_ipv4
  dns_interface      = var.dns_interface
  system_alias       = var.system_alias
  system_hostname    = var.system_hostname
}

module "fw_objects" {
  source                 = "./objects"
  geo_locations          = var.geo_locations
  service_objects        = var.service_objects
  address_grp_shared_srv = var.address_grp_shared_srv
  address_iot_groups     = var.address_iot_groups
  schedule_objects       = var.schedule_objects
}

module "fw_interfaces" {
  source = "./interfaces"

}

module "fw_policy" {
  source = "./policy"

}

module "vpn_forticlient" {
  source = "./vpn-p2s"

}

