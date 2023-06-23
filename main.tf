data "google_client_config" "default" {}

data "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location
  project  = var.project
}

module "service_monitor_crd" {
  count  = var.service_monitor_crd_enabled ? 1 : 0
  source = "./addons/service_monitor_crd"
}

# Ingress Nginx Controller
module "ingress_nginx_controller" {
  source                = "./addons/ingress-nginx"
  count                 = var.ingress_nginx_enabled ? 1 : 0
  ingress_nginx_version = var.ingress_nginx_version
  project               = var.project
  region                = var.region
  environment           = var.environment
  cluster_name          = var.cluster_name
  vpc_name              = var.vpc_name
}

# Cert-Manager
module "cert_manager" {
  source = "./addons/cert-manager"

  cert_manager_version = var.cert_manager_version
}

resource "helm_release" "cert_manager_le_http" {
  depends_on = [module.cert_manager]
  count      = var.cert_manager_install_letsencrypt_http_issuers ? 1 : 0
  name       = "cert-manager-le-http"
  chart      = "${path.module}/addons/cert-manager-le-http"
  version    = "0.1.0"
  set {
    name  = "email"
    value = var.cert_manager_letsencrypt_email
    type  = "string"
  }
}

# External-Secrets 
module "external_secrets" {
  source = "./addons/external-secrets"
  count  = var.external_secret_enabled ? 1 : 0

  project_id               = var.project
  environment              = var.environment
  enable_service_monitor   = var.enable_service_monitor
  external_secrets_version = var.external_secrets_version
}

# Keda
module "keda" {
  source                 = "./addons/keda"
  depends_on             = [module.service_monitor_crd]
  count                  = var.enable_keda ? 1 : 0
  environment            = var.environment
  project_id             = var.project
  enable_service_monitor = var.enable_service_monitor
  keda_version           = var.keda_version
}

# Reloader
module "reloader" {
  source                 = "./addons/reloader"
  depends_on             = [module.service_monitor_crd]
  count                  = var.enable_reloader ? 1 : 0
  reloader_version       = var.reloader_version
  enable_service_monitor = var.enable_service_monitor
}