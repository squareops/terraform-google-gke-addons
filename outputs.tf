output "nginx_ingress_controller_lb" {
  value       = module.ingress_nginx_controller.nginx_ingress_controller_lb
  description = "NGINX Ingress Controller Load Balancer IP"
}
