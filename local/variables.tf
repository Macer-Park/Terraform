# variable "file_name" {
#   default = "var_test.txt"
# }

# variable "string" {
#   type        = string
#   description = "var String"
#   default     = "myString"
# }

# variable "number" {
#   type    = number
#   default = 123
# }

# variable "boolean" {
#   default = true
# }

# variable "list" {
#   default = [
#     "google",
#     "vmware",
#     "amazon",
#     "microsoft"
#   ]
# }

# variable "map" {
#   default = {
#     aws   = "amazon",
#     azure = "microsoft",
#     gcp   = "google"
#   }
# }

# variable "set" {
#   type = set(string)
#   default = [
#     "google",
#     "vmware",
#     "amazon",
#     "microsoft"
#   ]
# }

# variable "object" {
#   type = object({ name = string, age = number })
#   default = {
#     name = "abc",
#     age  = 12
#   }
# }

# variable "tuple" {
#   type    = tuple([string, number, bool])
#   default = ["abc", 123, true]
# }

# variable "ingree_rules" {
#   type = list(object({
#     port        = number,
#     description = optional(string),
#     protocol    = optional(string, "tcp"),
#   }))
#   default = [
#     { port = 80, description = "web" },
#     { port = 53, protocol = "udp" }
#   ]
# }

# # variable "image_id" {
# #   type = string
# #   description = "The id of the machine image (AMI) to use for the server."

# #   validation {
# #     condition = length(var.image_id) > 4
# #     error_message = "The image_id value must exceed 4"
# #   }

# #   validation {
# #     condition = can(regex("^ami-", var.image_id))
# #     error_message = "The image_id value must starting with \"ami-\"."
# #   }
# # }

# variable "mypassword" {
#   type    = string
#   default = "Welcome to Terraform"
# }

# variable "my_var" {
#   default = "var2"
# }

# variable "names" {
#   type    = list(string)
#   default = ["a", "b", "c"]
# }

# variable "each_names" {
#   default = {
#     "a" = "a1",
#     # "b" = "b1",
#     "c" = "c1"
#   }
# }

# variable "for_names" {
#   default = ["a", "b", "c"]
# }

# variable "for_syntax_check_names" {
#   type    = list(string)
#   default = ["a", "b"]
# }

# variable "members" {
#   type = map(object({
#     role = string
#   }))
#   default = {
#     ab = {
#       role = "member", group = "dev"
#     }
#     cd = {
#       role = "admin", group = "dev"
#     }
#     ef = {
#       role = "member", group = "ops"
#     }
#   }
# }

# variable "dynamic_block_names" {
#   default = {
#     a = "hello a"
#     b = "hello b"
#     c = "hello c"
#   }
# }

# variable "enable_file" {
#   default = true
# }

# variable "sensitive_content" {
#   default = "secret"
#   sensitive = true
# }