locals {

  # Color Code IDs
  geolocation_obj_color_id  = 9
  subnet_obj_color_id       = 3
  addressgroup_obj_color_id = 4
  fw_service_obj_color_id   = 2

  geo_locations = {
    china = {
      country = "CN",
      name    = "geo-china"
    },
    russia = {
      country = "RU",
      name    = "geo-russia"
    },
    iran = {
      country = "IR",
      name    = "geo-iran"
    }
  }

  address_grp_shared_srv = {
    unificontroller = {
      name      = "grp-unificontroller"
      subnet    = "192.168.1.10 255.255.255.255"
      interface = "any"
    },
    pihole = {
      name      = "grp-pihole"
      subnet    = "192.168.1.53 255.255.255.255"
      interface = "any"
    },
    portainer = {
      name      = "grp-portainer"
      subnet    = "192.168.1.53 255.255.255.255"
      interface = "any"
    }
  }

  service_objects = {
    servicebus = {
      name      = "AMPQ"
      iprange    = "0.0.0.0"
      protocol = "TCP/UDP/SCTP"
      tcp_portrange = "5671 5672 443 9350 9354"
      comment = "Msg service port used for Azure Service Bus"
    },
    portainer = {
      name      = "PORTAINER"
      iprange    = "0.0.0.0"
      protocol = "TCP/UDP/SCTP"
      tcp_portrange = "8000 9000"
      comment = "Portainer ports for docker"
    }

  }



# BUG - VLAN not assinging to interface for the object
  address_iot_groups = {
    huecontroller = {
      name      = "grp-huecontroller"
      subnet    = "192.168.30.3 255.255.255.255"
      interface = "VLAN_30_IOT"
    }

  }



}