variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "environment" {
  description = "Environment in which the infrastructure is deployed (e.g., production, staging, development)"
  type        = string
}

variable "region" {
  description = "Region where the resources will be provisioned"
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
  default     = "latest"
}

variable "service_monitor_crd_enabled" {
  description = "Enable or disable the Service Monitor Custom Resource Definition (CRD) for Prometheus monitoring"
  type        = bool
  default     = false
}

variable "project" {
  description = "ID of the Google Cloud project"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}
