

resource "fortios_firewallservice_custom" "trname" {
  app_service_type    = "disable"
  category            = "Custom Apps"
  color               = 2
  iprange             = "0.0.0.0"
  name                = "AMPQ-ALT01"
  protocol            = "TCP/UDP/SCTP"
  tcp_portrange       = "5671 5672 443 9350 9354"
  visibility          = "enable"
  comment = "Used for Azure Service Bus"
}