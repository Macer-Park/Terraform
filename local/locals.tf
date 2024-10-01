# variable "prefix" {
#   default = "test"
# }

# locals {
#   name    = "terraform"
#   content = "${var.prefix} ${local.name}"
#   my_info = {
#     age    = 20
#     region = "KR"
#   }
#   my_nums = [1, 2, 3, 4, 5]
# }

# resource "local_file" "local_test" {
#   content  = local.content
#   filename = "local_test.txt"
# }