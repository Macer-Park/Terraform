module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "module-test-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-northeast-2a", "ap-northeast-2c"]
  #   private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  #   enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "terraform-module-sg-http"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.aws_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"

  name        = "terraform-module-sg-ssh"
  description = "Security group for SSH"
  vpc_id      = module.aws_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}