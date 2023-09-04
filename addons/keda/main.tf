resource "google_service_account" "keda" {
  project      = var.project_id
  account_id   = format("%s-%s-%s", var.environment, var.GCP_GSA_NAME, var.name)
  display_name = "Service Account for Keda Scaler"
}

resource "google_service_account_iam_member" "pod_identity" {
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[keda/${var.GCP_KSA_NAME}]"
  service_account_id = google_service_account.keda.name
}

resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

resource "helm_release" "keda" {
  depends_on = [kubernetes_namespace.keda]
  name       = "keda"
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  namespace  = "keda"
  timeout    = 600
  version    = format("%s%s", "v", var.keda_version)

  values = [
    templatefile("${path.module}/values.yaml", {
      enable_service_monitor = var.enable_service_monitor,
      gcpIAMServiceAccount   = "${var.environment}-${var.GCP_GSA_NAME}-${var.name}@${var.project_id}.iam.gserviceaccount.com"
    })
  ]
}
