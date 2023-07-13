# ingress-nginx

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall_rules"></a> [firewall\_rules](#module\_firewall\_rules) | terraform-google-modules/network/google//modules/firewall-rules | 7.1.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [helm_release.ingress_nginx_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.ingress_nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.get_ingress_nginx_controller_svc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the infrastructure is deployed (e.g., production, staging, development) | `string` | n/a | yes |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Enable or disable the nginx-ingress controller | `bool` | `false` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | Version of the nginx-ingress controller | `string` | `"latest"` | no |
| <a name="input_project"></a> [project](#input\_project) | ID of the Google Cloud project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the resources will be provisioned | `string` | n/a | yes |
| <a name="input_service_monitor_crd_enabled"></a> [service\_monitor\_crd\_enabled](#input\_service\_monitor\_crd\_enabled) | Enable or disable the Service Monitor Custom Resource Definition (CRD) for Prometheus monitoring | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_ingress_controller_lb"></a> [nginx\_ingress\_controller\_lb](#output\_nginx\_ingress\_controller\_lb) | NGINX Ingress Controller Load Balancer IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
