/*
DNS configuration
*/
dns_primary_ipv4   = "1.1.1.1"
dns_secondary_ipv4 = "1.0.0.1"
dns_interface      = "wan2"

/*
System configuration
- If in HA use the naming cftfl1pfga1 cftfl1pfgb1
*/
system_hostname = "cftfl1pfg01"
system_alias    = "cftfl1pfg01"

/*
Geo Location objects to block/allow by region
*/
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

/*
Service Objects
*/
service_objects = {
  servicebus = {
    name          = "AMPQ"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "5671 5672 443 9350 9354"
    comment       = "Msg service port used for Azure Service Bus"
  },
  portainer = {
    name          = "PORTAINER"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "8000 9000"
    comment       = "Portainer ports for docker"
  }
}

/*
Address groups for shared serviecs
*/
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

/*
Address groups for IOT Devices
*/
address_iot_groups = {
  huecontroller = {
    name      = "grp-huecontroller"
    subnet    = "192.168.30.3 255.255.255.255"
    interface = "VLAN_30_IOT"
  }

}

/*
Schedule Objects
*/
schedule_objects = {
  weekday_allday = {
    day   = "monday tuesday wednesday thursday friday"
    end   = "00:00"
    name  = "weekday-allday"
    start = "00:00"
  },
  weekends_allday = {
    day   = "sunday saturday"
    end   = "00:00"
    name  = "weekend-allday"
    start = "00:00"
  }
  weekday_bizhours = {
    day   = "monday tuesday wednesday thursday friday"
    end   = "06:00"
    name  = "weekday-bizhours"
    start = "16:00"
  }

}