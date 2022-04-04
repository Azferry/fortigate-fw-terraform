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
  source = "./fgsystem"

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
