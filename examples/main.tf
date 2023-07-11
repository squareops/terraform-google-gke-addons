locals {
  region      = "asia-south1"
  environment = "dev"
  name        = "org"
  project_name = "abc-123456789"
  cluster_name = ""
}

module "gke_addons" {
    source = "../"
    
    cluster_name = "test-dev-gke-cluster"
    location = local.region
    project = local.project
    environment = local.environment
    ingress_nginx_enabled = true
    cert_manager_enabled = true
    cert_manager_install_letsencrypt_http_issuers = true
    external_secret_enabled = true
    service_monitor_crd_enabled = true
    enable_keda = true
    enable_reloader = true
    vpc_name = "skaf-dev-vpc"

}