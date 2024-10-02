# # variable "prefix" {
# #   default = "test"
# # }

# # locals {
# #   name    = "terraform"
# #   content = "${var.prefix} ${local.name}"
# #   my_info = {
# #     age    = 20
# #     region = "KR"
# #   }
# #   my_nums = [1, 2, 3, 4, 5]
# # }

# # resource "local_file" "local_test" {
# #   content  = local.content
# #   filename = "local_test.txt"
# # }

# Define the ALB Hosted Zone ID based on the region
locals {
  alb_hosted_zone_id = "Z2Y3D6PIMW3EAR" # Replace with your region's ALB hosted zone ID if different
}
# # locals {
# #   ec2_instance_ids = [
# #     for ec2_module in module.terraform-public-ec2-module-set :
# #     ec2_module.id
# #   ]
# # }
# # locals {
# #   ec2_instance_ids = [
# #     for ec2_module in module.terraform-public-ec2-module-set :
# #     ec2_module.id
# #   ]
# # }

# locals {
#   target_groups = {
#     ex-instance-1 = {
#       name_prefix = "h1-1"
#       protocol    = "HTTP"
#       port        = 80
#       target_type = "instance"
#       target_id   = module.terraform-public-ec2-module-set["one"].id
#     }
#     ex-instance-2 = {
#       name_prefix = "h1-2"
#       protocol    = "HTTP"
#       port        = 80
#       target_type = "instance"
#       target_id   = module.terraform-public-ec2-module-set["two"].id
#     }
#   }
# }

