resource "fortios_vpnssl_settings" "vpn_ssl_syssettings" {
  # login_attempt_limit = 2
  # login_block_time    = 60
  # login_timeout       = 30
  # source_interface {
  #   name = "wan2"
  # }
  port                = 4443
  # servercert          = "self-sign"
}