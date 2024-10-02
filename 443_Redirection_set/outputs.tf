output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = aws_lb.terraform_lb.dns_name
}
output "instance_ids" {
  description = "Map of EC2 instance IDs"
  value = {
    for key, ec2_module in module.terraform-public-ec2-module-set :
    key => ec2_module.id
  }
}
output "The_WebSite_URL" {
  description = "The Result of Auto Provisioning Redirect HTTP to HTTPS Web Server"
  value       = "https://${aws_route53_record.terraform_a_record.fqdn}.${var.route_53_zone}"
}