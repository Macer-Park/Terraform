# output "module_output_california" {
#   value = module.ec2_california.private_ip
# }

# output "module_output_seoul" {
#   value = module.ec2_seoul.private_ip
# }

# output "module_output_seoul_count" {
#   value = module.ec2_seoul[*].private_ip
# }

output "module_output" {
  value = [
    for k in module.ec2_seoul : k.private_ip
  ]
}