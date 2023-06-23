variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "environment" {
  description = "Environment in which the infrastructure is being deployed (e.g., production, staging, development)"
  type        = string
}

variable "GCP_GSA_NAME" {
  description = "Google Cloud Service Account name"
  type        = string
  default     = "external-secrets"
}

variable "GCP_KSA_NAME" {
  description = "Google Kubernetes Service Account name"
  type        = string
  default     = "external-secrets"
}

variable "enable_service_monitor" {
  description = "Enable or disable service monitor"
  type        = bool
  default     = false
}

variable "external_secrets_version" {
  description = "Version of the external-secret operator"
  type        = string
  default     = "latest"
}