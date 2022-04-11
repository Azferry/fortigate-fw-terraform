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
  source = "./objects"

}

module "fw_interfaces" {
  source = "./interfaces"

}

module "fw_policy" {
  source = "./policy"

}
