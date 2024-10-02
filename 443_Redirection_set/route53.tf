resource "aws_route53_record" "terraform_a_record" {
  zone_id = var.route_53_hosted_zone_id
  name    = var.route_53_record_name
  type    = "A"

  alias {
    name                   = aws_lb.terraform_lb.dns_name
    zone_id                = aws_lb.terraform_lb.zone_id
    evaluate_target_health = true
  }
  depends_on = [aws_lb.terraform_lb]
}