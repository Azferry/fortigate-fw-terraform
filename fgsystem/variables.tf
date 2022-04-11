
/*
DNS Variables
*/

variable "dns_primary_ipv4" {
  description = "IPV 4 Address for DNS primary"
  default     = "1.1.1.1"
  type        = string
}

variable "dns_secondary_ipv4" {
  description = "IPV 4 Address for DNS secondary"
  default     = "1.0.0.1"
  type        = string
}

variable "dns_interface" {
  description = "Interface source for the dns service - wan for pub"
  default     = "wan2"
  type        = string
}

variable "dns_cache_limit" {
  description = "dns_cache_limit"
  default     = 5000
  type        = number
}

variable "dns_cache_ttl" {
  description = "dns_cache_ttl"
  default     = 1800
  type        = number
}


/*
system config varibles
*/
variable "system_alias" {
  type        = string
  description = "system alias"
  default     = "FG80F"
}

variable "system_hostname" {
  type        = string
  description = "system hostname"
  default     = "FG80F"
}

variable "system_timezone_id" {
  type        = string
  description = "ID of the timezone "
  default     = "12"
}

variable "system_admin_https_port" {
  type        = number
  description = "Admin port for access to web interface"
  default     = 443
}

variable "system_admin_http_port" {
  type        = number
  description = "Admin port for access to web interface"
  default     = 80
}