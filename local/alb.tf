











# module "alb" {
#   source = "terraform-aws-modules/alb/aws"

#   name    = "my-alb"
#   vpc_id  = module.aws_vpc.vpc_id
#   subnets = module.aws_vpc.public_subnets

#   security_group_ingress_rules = {
#     all_http = {
#       from_port   = 80
#       to_port     = 80
#       ip_protocol = "tcp"
#       description = "HTTP web traffic"
#       cidr_ipv4   = "0.0.0.0/0"
#     }
#     all_https = {
#       from_port   = 443
#       to_port     = 443
#       ip_protocol = "tcp"
#       description = "HTTPS web traffic"
#       cidr_ipv4   = "0.0.0.0/0"
#     }
#   }
#   security_group_egress_rules = {
#     all = {
#       ip_protocol = "-1"
#       cidr_ipv4   = "10.0.0.0/16"
#     }
#   }

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

#   listeners = {
#     ex-http-https-redirect = {
#       port     = 80
#       protocol = "HTTP"
#       redirect = {
#         port        = "443"
#         protocol    = "HTTPS"
#         status_code = "HTTP_301"
#       }
#     }
#     ex-https = {
#       port            = 443
#       protocol        = "HTTPS"
#       certificate_arn = var.route53_credentials

#       forward = {
#         target_group_keys = ["ex-instance-one", "ex-instance-two"]
#       }
#     }
#   }

#   target_groups = {
#     ex-instance-one = {
#       name_prefix = "h1"
#       protocol    = "HTTP"
#       port        = 80
#       target_type = "instance"
#       target_id   = module.terraform-public-ec2-module-set["one"].id
#     }
#     ex-instance-two = {
#       name_prefix = "h1"
#       protocol    = "HTTP"
#       port        = 80
#       target_type = "instance"
#       target_id   = module.terraform-public-ec2-module-set["two"].id
#     }
#   }

#   tags = {
#     Environment = "Development"
#     Project     = "Example"
#   }
# }