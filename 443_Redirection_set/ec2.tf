module "terraform-public-ec2-module-set" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = {
    "one" = module.aws_vpc.public_subnets[0] # ap-northeast-2a 
    "two" = module.aws_vpc.public_subnets[1] # ap-northeast-2c
  }

  name = "terraform-public-ec2-${each.key}"

  instance_type = "t2.micro"
  key_name      = var.key_pair
  monitoring    = true
  vpc_security_group_ids = [
    module.http_https_ssh_sg.security_group_id
  ]
  subnet_id  = each.value
  create_eip = true
  eip_domain = "vpc"

  user_data = base64encode(templatefile("${path.module}/user_data.sh.tpl", {}))
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}