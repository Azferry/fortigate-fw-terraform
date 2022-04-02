

resource "fortios_firewallservice_custom" "ampq" {
  app_service_type    = "disable"
  category            = "Custom Apps"
  color               = 2
  iprange             = "0.0.0.0"
  name                = "AMPQ"
  protocol            = "TCP/UDP/SCTP"
  tcp_portrange       = "5671 5672 443 9350 9354"
  visibility          = "enable"
  comment = "Used for Azure Service Bus"
}



resource "fortios_firewallservice_custom" "portainer" {
  app_service_type    = "disable"
  category            = "Custom Apps"
  color               = 2
  iprange             = "0.0.0.0"
  name                = "PORTAINER"
  protocol            = "TCP/UDP/SCTP"
  tcp_portrange       = "8000 9000"
  visibility          = "enable"
  comment = "Portainer ports for docker"
}