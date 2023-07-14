# GKE Addons
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
Terraform module to create GKE cluster resources for workload deployment on GCP Cloud.

## Usage Example
```hcl
module "gke_addons" {
  source                                        = "squareops/gke-addons/google"
  cluster_name                                  = "cluster_name"
  location                                      = "asia-south1"
  project                                       = "project-id"
  environment                                   = "dev"
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
```
Refer [examples]() for more details.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.51, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.51, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | ./addons/cert-manager | n/a |
| <a name="module_external_secrets"></a> [external\_secrets](#module\_external\_secrets) | ./addons/external-secrets | n/a |
| <a name="module_ingress_nginx_controller"></a> [ingress\_nginx\_controller](#module\_ingress\_nginx\_controller) | ./addons/ingress-nginx | n/a |
| <a name="module_keda"></a> [keda](#module\_keda) | ./addons/keda | n/a |
| <a name="module_reloader"></a> [reloader](#module\_reloader) | ./addons/reloader | n/a |
| <a name="module_service_monitor_crd"></a> [service\_monitor\_crd](#module\_service\_monitor\_crd) | ./addons/service_monitor_crd | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager_le_http](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Enable or disable the nginx-ingress controller | `bool` | `false` | no |
| <a name="input_cert_manager_install_letsencrypt_http_issuers"></a> [cert\_manager\_install\_letsencrypt\_http\_issuers](#input\_cert\_manager\_install\_letsencrypt\_http\_issuers) | Enable or disable installation of Let's Encrypt HTTP issuers for cert-manager | `bool` | `false` | no |
| <a name="input_cert_manager_letsencrypt_email"></a> [cert\_manager\_letsencrypt\_email](#input\_cert\_manager\_letsencrypt\_email) | Email address to register with Let's Encrypt for cert-manager | `string` | `""` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Version of cert-manager to deploy | `string` | `"1.12.2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Google Kubernetes Engine (GKE) cluster | `string` | n/a | yes |
| <a name="input_enable_keda"></a> [enable\_keda](#input\_enable\_keda) | Enable or disable keda deployment | `bool` | `false` | no |
| <a name="input_enable_reloader"></a> [enable\_reloader](#input\_enable\_reloader) | Enable or disable reloader | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the infrastructure is being deployed (e.g., production, staging, development) | `string` | n/a | yes |
| <a name="input_external_secret_enabled"></a> [external\_secret\_enabled](#input\_external\_secret\_enabled) | Enable or disable external-secrets deployment | `bool` | `false` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | Version of the external-secret operator | `string` | `"0.8.3"` | no |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Enable or disable the nginx-ingress controller | `bool` | `false` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | Version of the nginx-ingress controller | `string` | `"4.7.0"` | no |
| <a name="input_keda_version"></a> [keda\_version](#input\_keda\_version) | Version of KEDA to deploy | `string` | `"2.10.2"` | no |
| <a name="input_project"></a> [project](#input\_project) | ID of the Google Cloud project | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the resources will be provisioned | `string` | `"asia-south1"` | no |
| <a name="input_reloader_version"></a> [reloader\_version](#input\_reloader\_version) | Reloader release version | `string` | `"1.0.27"` | no |
| <a name="input_service_monitor_crd_enabled"></a> [service\_monitor\_crd\_enabled](#input\_service\_monitor\_crd\_enabled) | Enable or disable the installation of Custom Resource Definitions (CRDs) for Prometheus Service Monitor. | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC network | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_ingress_controller_lb"></a> [nginx\_ingress\_controller\_lb](#output\_nginx\_ingress\_controller\_lb) | NGINX Ingress Controller Load Balancer IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
