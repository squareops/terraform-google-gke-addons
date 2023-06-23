resource "kubernetes_namespace" "reloader" {

  metadata {
    name = "reloader"
  }
}

resource "helm_release" "reloader" {
  depends_on = [kubernetes_namespace.reloader]

  name              = "reloader"
  repository        = "https://stakater.github.io/stakater-charts"
  chart             = "reloader"
  namespace         = "reloader"
  dependency_update = true
  reset_values      = true
  atomic            = true
  replace           = true
  version           = format("%s%s", "v", var.reloader_version)
  timeout           = 600

  values = [
    templatefile("${path.module}/values.yaml", {
      enable_service_monitor = var.enable_service_monitor
    })
  ]
  lifecycle {
    create_before_destroy = true
  }
}