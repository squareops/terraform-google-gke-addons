# External IP for nginx-ingress controller
resource "google_compute_address" "ingress_ip_address" {
  name    = format("%s-%s-nginx-controller-ip", var.cluster_name, var.environment)
  region  = var.region
  project = var.project
}

resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx_controller" {
  depends_on = [kubernetes_namespace.ingress_nginx]

  name       = "ingress-nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  version    = var.ingress_nginx_version
  timeout    = 600

  values = [
    templatefile("${path.module}/values.yaml", {
      enable_service_monitor = var.service_monitor_crd_enabled
    })
  ]

  set {
    name  = "controller.service.loadBalancerIP"
    value = google_compute_address.ingress_ip_address.address
  }
}

data "kubernetes_service" "get_ingress_nginx_controller_svc" {
  depends_on = [helm_release.ingress_nginx_controller]
  metadata {
    name      = "ingress-nginx-controller-controller"
    namespace = "ingress-nginx"
  }
}

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project
  network_name = var.vpc_name

  rules = [
    {
      name                    = format("%s-%s-kubernetes-master-nodes-access", var.cluster_name, var.environment)
      description             = null
      direction               = "INGRESS"
      priority                = null
      ranges                  = ["0.0.0.0/0"]
      source_tags             = null
      source_service_accounts = null
      target_tags             = null
      target_service_accounts = null
      allow = [{
        protocol = "tcp"
        ports    = ["8443", "6443", "10250", "15017"]
      }]
      deny = []
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    },
  ]
}