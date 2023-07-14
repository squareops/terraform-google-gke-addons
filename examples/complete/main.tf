locals {
  region       = "asia-south1"
  environment  = "dev"
  name         = "org"
  project_name = "abc-123456789"
  cluster_name = ""
}

module "gke_addons" {
  source = "squareops/gke-addons/google"

  cluster_name                                  = local.cluster_name
  region                                        = local.region
  project                                       = local.project
  environment                                   = local.environment
  ingress_nginx_enabled                         = true
  cert_manager_enabled                          = true
  cert_manager_install_letsencrypt_http_issuers = true
  cert_manager_letsencrypt_email                = ""
  external_secret_enabled                       = true
  service_monitor_crd_enabled                   = true
  enable_keda                                   = true
  enable_reloader                               = true
  vpc_name                                      = "dev-vpc"

}
