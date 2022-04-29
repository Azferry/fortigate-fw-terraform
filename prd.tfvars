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
    udp_portrange = ""
    comment       = "Msg service port used for Azure Service Bus"
  },
  portainer = {
    name          = "PORTAINER"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "8000 9000"
    udp_portrange = ""
    comment       = "Portainer ports for docker"
  },
  https_alt = {
    name          = "HTTPS_ALT"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "8443"
    udp_portrange = ""
    comment       = "Alternative to https (8443)"
  },
  # https://kb.synology.com/en-me/DSM/tutorial/What_network_ports_are_used_by_Synology_services
  synology = {
    name          = "SYNOLOGY_UI"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "5000 5001"
    udp_portrange = ""
    comment       = "Synology Web DSM access on tcp ports 5000 (http) and 5001 (https)"
  },
  AFP = {
    name          = "AFP"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "548"
    udp_portrange = ""
    comment       = ""
  },
  FTP_OVER_TLS = {
    name          = "FTP_OVER_TLS"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "1025-65535"
    udp_portrange = ""
    comment       = ""
  },
  FTP_OVER_SSL = {
    name          = "FTP_OVER_SSL"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "20"
    udp_portrange = ""
    comment       = ""
  },
  CIFS = {
    name          = "CIFS"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "139 445"
    udp_portrange = "137 138"
    comment       = ""
  },
  iSCSI = {
    name          = "iSCSI"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "3265 3263 3260"
    udp_portrange = ""
    comment       = ""
  },
  HUE = {
    name          = "HUE"
    iprange       = "0.0.0.0"
    protocol      = "TCP/UDP/SCTP"
    tcp_portrange = "80 443"
    udp_portrange = "80 123"
    comment       = ""
  }

}

/*
Address groups for shared serviecs
*/
address_grp_shared_srv = {
  unificontroller = {
    name      = "grp-unificontroller"
    subnet    = "192.168.1.10 255.255.255.255"
    interface = "po1"
  },
  pihole = {
    name      = "grp-pihole"
    subnet    = "192.168.1.56 255.255.255.255"
    interface = "po1"
  },
  portainer = {
    name      = "grp-portainer"
    subnet    = "192.168.1.56 255.255.255.255"
    interface = "po1"
  }
}

/*
Address groups for IOT Devices
*/
address_iot_groups = {
  huecontroller = {
    name      = "grp-huecontroller"
    subnet    = "192.168.75.25 255.255.255.255"
    interface = "vlan.0075"
  }

}

/*
Schedule Objects used in the policy
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