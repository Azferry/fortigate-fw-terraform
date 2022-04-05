resource "fortios_system_dns" "sys_dns" {
  cache_notfound_responses = "disable"
  dns_cache_limit          = 5000
  dns_cache_ttl            = 1800
  # ip6_primary              = "2606:4700:4700::1111"
  # ip6_secondary            = "2606:4700:4700::1001"
  primary                  = "1.1.1.1"
  retry                    = 2
  secondary                = "1.0.0.1"
  timeout                  = 5
  interface                = "wan2"
}