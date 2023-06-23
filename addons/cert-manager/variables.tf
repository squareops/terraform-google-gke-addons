variable "cert_manager_version" {
  description = "Version of cert-manager to deploy"
  type        = string
  default     = "latest"
}

variable "enable_service_monitor" {
  description = "Enable or disable service monitor"
  type        = bool
  default     = false
}
