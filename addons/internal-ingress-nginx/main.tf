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
