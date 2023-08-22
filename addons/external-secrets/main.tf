resource "google_service_account" "external_secrets" {
  project      = var.project_id
  account_id   = format("%s-%s-%s", var.environment, var.GCP_GSA_NAME, var.name)
  display_name = "Service Account for External Secrets"
}

resource "google_project_iam_member" "secretadmin" {
  project = var.project_id
  role    = "roles/secretmanager.admin"
  member  = "serviceAccount:${google_service_account.external_secrets.email}"
}

resource "google_project_iam_member" "service_account_token_creator" {
  project = var.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.external_secrets.email}"
}

resource "google_service_account_iam_member" "pod_identity" {
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[secrets/${var.GCP_KSA_NAME}]"
  service_account_id = google_service_account.external_secrets.name
}

resource "kubernetes_namespace" "external_secrets" {
  metadata {
    name = "secrets"
  }
}

resource "helm_release" "external_secrets" {
  depends_on = [kubernetes_namespace.external_secrets]
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  namespace  = "secrets"
  timeout    = 600
  version    = var.external_secrets_version

  values = [
    templatefile("${path.module}/values.yaml", {
      enable_service_monitor = var.enable_service_monitor,
      service_account_email  = "${var.environment}-${var.GCP_GSA_NAME}@${var.project_id}.iam.gserviceaccount.com"
    })
  ]
}
