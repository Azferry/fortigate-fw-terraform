/*
Default configuration
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
  description = "DNS Sorce interface"
  default     = "wan2"
  type        = string
}

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
