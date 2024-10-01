provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias  = "seoul"
  region = "ap-northeast-2"
}

# module "ec2_california" {
#   source = "../modules/terraform-aws-ec2"
# }

# module "ec2_seoul" {
#   count  = 2
#   source = "../modules/terraform-aws-ec2"
#   providers = {
#     aws = aws.seoul
#   }
#   instance_type = "m5.large"
# }

locals {
  env = {
    dev = {
      type = "t3.micro"
      name = "dev_ec2"
    }
    prod = {
      type = "m5.large"
      name = "prod_ec2"
    }

  }
}

module "ec2_seoul" {
  for_each      = local.env
  source        = "../modules/terraform-aws-ec2"
  instance_type = each.value.type
  instance_name = each.value.name
}

