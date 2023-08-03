# GKE Addons
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This module provides a set of reusable, configurable, and scalable GCP GKE addons configurations. It enables users to easily deploy and manage a highly available GKE cluster using infrastructure as code. This module supports a wide range of features service monitors, Ingress nginx controller, Cert-Manager with Let's Encrypt, Reloader, and External Secrets. Users can configure these features using a set of customizable variables that allow for fine-grained control over the deployment. Additionally, this module is regularly updated to keep pace with the latest changes in the GKE ecosystem, ensuring that users always have access to the most up-to-date features and functionality.

## Usage Example
```hcl
module "gke_addons" {
  source                                        = "squareops/gke-addons/google"
  name                                          = "name"
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
Refer [examples](https://github.com/sq-ia/terraform-google-gke-addons/blob/main/examples/complete) for more details.

### Configure a Service Account
In order to execute this module you must have a Service Account with the roles mentioned in [IAM.md](https://github.com/sq-ia/terraform-google-gke-addons/blob/main/IAM.md).


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
| <a name="input_enable_keda"></a> [enable\_keda](#input\_enable\_keda) | Enable or disable keda deployment | `bool` | `false` | no |
| <a name="input_enable_reloader"></a> [enable\_reloader](#input\_enable\_reloader) | Enable or disable reloader | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the infrastructure is being deployed (e.g., production, staging, development) | `string` | n/a | yes |
| <a name="input_external_secret_enabled"></a> [external\_secret\_enabled](#input\_external\_secret\_enabled) | Enable or disable external-secrets deployment | `bool` | `false` | no |
| <a name="input_external_secrets_version"></a> [external\_secrets\_version](#input\_external\_secrets\_version) | Version of the external-secret operator | `string` | `"0.8.3"` | no |
| <a name="input_ingress_nginx_enabled"></a> [ingress\_nginx\_enabled](#input\_ingress\_nginx\_enabled) | Enable or disable the nginx-ingress controller | `bool` | `false` | no |
| <a name="input_ingress_nginx_version"></a> [ingress\_nginx\_version](#input\_ingress\_nginx\_version) | Version of the nginx-ingress controller | `string` | `"4.7.0"` | no |
| <a name="input_keda_version"></a> [keda\_version](#input\_keda\_version) | Version of KEDA to deploy | `string` | `"2.10.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The suffix name for the resources being created. | `string` | n/a | yes |
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


## Contribute & Issue Report

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/sq-ia/terraform-google-gke-addons/issues) on GitHub
  2. Search to check if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

## License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support Us

To support our GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/sq-ia/terraform-google-gke-addons)

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).
