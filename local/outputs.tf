# # output "list_index_0" {
# #   value = var.list.1
# # }

# # output "list_all" {
# #   value = [
# #     for name in var.list :
# #     upper(name)
# #   ]
# # }

# # output "local_test_output" {
# #   value = local_file.local_test.content
# # }

# # output "file_id" {
# #   value = local_file.abc.id
# # }

# # output "file_abspath" {
# #   value = abspath(local_file.abc.filename)
# # }

# # output "file_for_each_names" {
# #   value = local_file.for_names_abc.content
# # }

# # output "file_for_each_names_upper_case" {
# #   value = local_file.for_names_abc_upper.content
# # }

# # output "A_upper_value" {
# #   value = [for v in var.for_syntax_check_names : upper(v)]
# # }

# # output "B_index_and_value" {
# #   value = [for i, v in var.for_syntax_check_names : "${i} is ${v}"]
# # }

# # output "C_make_object" {
# #   value = { for v in var.for_syntax_check_names : v => upper(v) }
# # }

# # output "D_with_filter" {
# #   value = [for v in var.for_syntax_check_names : upper(v) if v != "a"]
# # }

# # output "A_to_tuple" {
# #   value = [for k, v in var.members : "${k} is ${v.role}"]
# # }

# # output "B_get_only_role" {
# #   value = {
# #     for name, user in var.members : name => user.role
# #     if user.role == "admin"
# #   }
# # }

# # output "C_group" {
# #   value = {
# #     for name, user in var.members : user.role => name...
# #   }
# # }

# # output "content_dynamic_block" {
# #   value = var.enable_file ? local_file.foo[0].content: ""
# # }

# # output "file_content" {
# #   value = local_file.b.content
# # }

# output "vpc_id" {
#   description = "The ID of the VPC created by the aws_vpc module."
#   value       = module.aws_vpc.vpc_id
# }

# # It has failed while i have to defined the method for the references data with the ec2-instances id value with alb.
# output "instance_ids" {
#   description = "The IDs of the EC2 instances created by the terraform-public-ec2-module-set."
#   value = {
#     for key, instance in module.terraform-public-ec2-module-set :
#     key => instance.id
#   }
# }

output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = module.alb.dns_name
}

output "alb_zone_id" {
  description = "The hosted zone ID of the ALB."
  value       = local.alb_hosted_zone_id
}

output "ec2_module_outputs" {
  value = module.terraform-public-ec2-module-set
}

output "instance_ids" {
  description = "Map of EC2 instance IDs"
  value = {
    for key, ec2_module in module.terraform-public-ec2-module-set :
    key => ec2_module.id
  }
}

