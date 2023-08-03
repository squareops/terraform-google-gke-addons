variable "name" {
  description = "The suffix name for the resources being created."
  type        = string
}

variable "ingress_nginx_enabled" {
  description = "Enable or disable the nginx-ingress controller"
  type        = bool
  default     = false
}

variable "ingress_nginx_version" {
  description = "Version of the nginx-ingress controller"
  type        = string
  default     = "4.7.0"
}

variable "project" {
  description = "ID of the Google Cloud project"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region where the resources will be provisioned"
  type        = string
  default     = "asia-south1"
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = ""
}

variable "cert_manager_enabled" {
  description = "Enable or disable the nginx-ingress controller"
  type        = bool
  default     = false
}

variable "cert_manager_version" {
  description = "Version of cert-manager to deploy"
  type        = string
  default     = "1.12.2"
}

variable "cert_manager_install_letsencrypt_http_issuers" {
  description = "Enable or disable installation of Let's Encrypt HTTP issuers for cert-manager"
  type        = bool
  default     = false
}

variable "cert_manager_letsencrypt_email" {
  description = "Email address to register with Let's Encrypt for cert-manager"
  type        = string
  default     = ""
}

variable "external_secret_enabled" {
  description = "Enable or disable external-secrets deployment"
  type        = bool
  default     = false
}

variable "external_secrets_version" {
  description = "Version of the external-secret operator"
  type        = string
  default     = "0.8.3"
}

variable "environment" {
  description = "Environment in which the infrastructure is being deployed (e.g., production, staging, development)"
  type        = string
}

variable "service_monitor_crd_enabled" {
  description = "Enable or disable the installation of Custom Resource Definitions (CRDs) for Prometheus Service Monitor. "
  default     = false
  type        = bool
}

variable "enable_keda" {
  description = "Enable or disable keda deployment"
  type        = bool
  default     = false
}

variable "keda_version" {
  description = "Version of KEDA to deploy"
  type        = string
  default     = "2.10.2"
}

variable "enable_reloader" {
  description = "Enable or disable reloader"
  default     = false
  type        = bool
}

variable "reloader_version" {
  description = "Reloader release version"
  default     = "1.0.27"
  type        = string
}
