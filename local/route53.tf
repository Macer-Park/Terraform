# Route53 Records Module to add 'terraform.chungyun.net' as an alias to the ALB
module "terraform_chungyun_net_record" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_id = data.aws_route53_zone.chungyun_net.zone_id

  records = [
    {
      name = "terraform" # This will create terraform.chungyun.net
      type = "A"
      alias = {
        name                   = module.alb.dns_name      # ALB's DNS name from the ALB module output
        zone_id                = local.alb_hosted_zone_id # ALB's Hosted Zone ID defined earlier
        evaluate_target_health = true                     # Optional: evaluates the health of the ALB
      }
    }
  ]

  # Ensure this module runs after the ALB is created
  depends_on = [module.alb]
}