# output "list_index_0" {
#   value = var.list.1
# }

# output "list_all" {
#   value = [
#     for name in var.list :
#     upper(name)
#   ]
# }

# output "local_test_output" {
#   value = local_file.local_test.content
# }

# output "file_id" {
#   value = local_file.abc.id
# }

# output "file_abspath" {
#   value = abspath(local_file.abc.filename)
# }

# output "file_for_each_names" {
#   value = local_file.for_names_abc.content
# }

# output "file_for_each_names_upper_case" {
#   value = local_file.for_names_abc_upper.content
# }

# output "A_upper_value" {
#   value = [for v in var.for_syntax_check_names : upper(v)]
# }

# output "B_index_and_value" {
#   value = [for i, v in var.for_syntax_check_names : "${i} is ${v}"]
# }

# output "C_make_object" {
#   value = { for v in var.for_syntax_check_names : v => upper(v) }
# }

# output "D_with_filter" {
#   value = [for v in var.for_syntax_check_names : upper(v) if v != "a"]
# }

# output "A_to_tuple" {
#   value = [for k, v in var.members : "${k} is ${v.role}"]
# }

# output "B_get_only_role" {
#   value = {
#     for name, user in var.members : name => user.role
#     if user.role == "admin"
#   }
# }

# output "C_group" {
#   value = {
#     for name, user in var.members : user.role => name...
#   }
# }

# output "content_dynamic_block" {
#   value = var.enable_file ? local_file.foo[0].content: ""
# }

# output "file_content" {
#   value = local_file.b.content
# }