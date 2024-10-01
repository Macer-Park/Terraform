# module "terraform-public-ec2-module" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   name = "terraform-public-ec2"

#   instance_type          = "t2.micro"
#   key_name               = "Chungyun"
#   monitoring             = true
#   vpc_security_group_ids = [module.ssh_security_group.security_group_id]
#   subnet_id              = module.aws_vpc.public_subnets[0]
#   create_eip = true
#   eip_domain = "vpc"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }

module "terraform-public-ec2-module-set" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = {
    "one" = module.aws_vpc.public_subnets[0] # ap-northeast-2a 서브넷
    "two" = module.aws_vpc.public_subnets[1] # ap-northeast-2c 서브넷
  }

  name = "terraform-public-ec2-${each.key}"

  instance_type = "t2.micro"
  key_name      = "Chungyun"
  monitoring    = true
  vpc_security_group_ids = [
    module.ssh_security_group.security_group_id,
    module.web_server_sg.security_group_id
  ]
  subnet_id  = each.value
  create_eip = true
  eip_domain = "vpc"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# module "terraform-private-ec2-module" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   name = "terraform-private-ec2"

#   instance_type = "t2.micro"
#   monitoring    = true
#   vpc_security_group_ids = [
#     module.ssh_security_group.security_group_id,
#     module.web_server_sg.security_group_id
#   ]
#   subnet_id = module.aws_vpc.private_subnets[1]
#   user_data = base64encode(templatefile("${path.module}/user_data.sh.tpl", {}))

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }