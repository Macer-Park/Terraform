module "http_https_ssh_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "HTTP(S)_SSH_Permit_SG"
  description = "Security group for HTTP(S) & SSH publicly open"
  vpc_id      = module.aws_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}