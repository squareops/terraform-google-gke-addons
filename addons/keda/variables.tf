variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "name" {
  description = "The suffix name for the resources being created."
  type        = string
}

variable "environment" {
  description = "Environment in which the infrastructure is being deployed (e.g., production, staging, development)"
  type        = string
}

variable "GCP_GSA_NAME" {
  description = "Google Cloud Service Account name"
  type        = string
  default     = "keda"
}

variable "GCP_KSA_NAME" {
  description = "Google Kubernetes Service Account name"
  type        = string
  default     = "keda-operator"
}

variable "enable_service_monitor" {
  description = "Enable or disable service monitor"
  type        = bool
  default     = false
}

variable "keda_version" {
  description = "Version of KEDA to deploy"
  type        = string
  default     = "latest"
}
