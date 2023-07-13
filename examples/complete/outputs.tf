output "nginx_ingress_controller_lb" {
  value       = module.gke_addons.nginx_ingress_controller_lb
  description = "NGINX Ingress Controller Load Balancer IP"
}
