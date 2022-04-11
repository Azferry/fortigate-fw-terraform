/*
Geo Location objects to block/allow by region
*/
variable "geo_locations" {
  description = "GeoLocation objects for address objects"
  type = map(object({
    country = string
    name = string
  }))
  default = {
    china = {
      country = "CN",
      name    = "geo-china"
    }
  }
}

/*
Service Objects 
*/
variable "service_objects" {
  description = "Service objects"
  type = map(object({
    name = string
    iprange = string
    protocol = string
    tcp_portrange = string
    comment = string
  }))
  default = {
    servicebus = {
      name      = "AMPQ"
      iprange    = "0.0.0.0"
      protocol = "TCP/UDP/SCTP"
      tcp_portrange = "5671 5672 443 9350 9354"
      comment = "Msg service port used for Azure Service Bus"
    }
  }
}

/*
Address groups for shared serviecs
*/
variable "address_grp_shared_srv" {
  description = "Address groups shared services"
  type = map(object({
    name = string
    subnet = string
    interface = string
  }))
  default = {
    unificontroller = {
      name      = "grp-unificontroller"
      subnet    = "192.168.1.10 255.255.255.255"
      interface = "any"
    }
  }
}


/*
Address groups for iot serviecs
*/
variable "address_iot_groups" {
  description = "Address groups iot services"
  type = map(object({
    name = string
    subnet = string
    interface = string
  }))
  default = {
    huecontroller = {
      name      = "grp-huecontroller"
      subnet    = "192.168.30.3 255.255.255.255"
      interface = "VLAN_30_IOT"
    }
  }
}

/*
Schedule objects 
*/
variable "schedule_objects" {
  description = "Schedule objects"
  type = map(object({
    day = string
    end = string
    name = string
    start = string
  }))
  default = {
    weekends_allday = {
      day   = "monday tuesday wednesday thursday friday"
      end   = "00:00"
      name  = "weekday-allday"
      start = "00:00"
    }
  }
}