resource "fortios_system_dns" "sys_dns" {
  cache_notfound_responses = "disable"
  dns_cache_limit          = var.dns_cache_limit
  dns_cache_ttl            = var.dns_cache_ttl
  primary                  = var.dns_primary_ipv4
  retry                    = 2
  secondary                = var.dns_secondary_ipv4
  timeout                  = 5
  interface                = var.dns_interface
  # ip6_primary              = "2606:4700:4700::1111"
  # ip6_secondary            = "2606:4700:4700::1001"
}