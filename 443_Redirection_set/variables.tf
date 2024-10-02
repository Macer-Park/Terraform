variable "route53_credentials" {
  sensitive   = true
  type        = string
  description = "HTTPS Credentials with AWS ALB"
}

variable "route_53_zone" {
  sensitive   = false
  type        = string
  description = "Route 53 Domain for HTTPS Test"
}

variable "route_53_hosted_zone_id" {
  sensitive   = true
  type        = string
  description = "Route 53 Hosted Zone ID"
}

variable "key_pair" {
  sensitive   = true
  type        = string
  description = "Remote Access Keypair"
}

variable "route_53_record_name" {
  sensitive   = true
  type        = string
  description = "Route 53 Record Name"
}