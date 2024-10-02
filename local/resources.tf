# data "archive_file" "dotfiles" {
#   type        = "zip"
#   output_path = "${path.module}/dotfiles.zip"

#   source {
#     content  = "hello a"
#     filename = "${path.module}/a.txt"
#   }

#   source {
#     content  = "hello b"
#     filename = "${path.module}/b.txt"
#   }

#   source {
#     content  = "hello c"
#     filename = "${path.module}/c.txt"
#   }
# }

# data "archive_file" "dotfiles" {
#   type        = "zip"
#   output_path = "${path.module}/dotfiles.zip"

#   dynamic "source" {
#     for_each = var.dynamic_block_names
#     content {
#       content  = source.value
#       filename = "${path.module}/${source.key}.txt"
#     }
#   }
# }

# resource "local_file" "foo" {
#   count = var.enable_file ? 1 : 0
#   content = "foo!"
#   filename = "${path.module}/foo.bar"
# }

# resource "local_file" "foo_provisioner" {
#   content = upper(var.sensitive_content)
#   filename = "${path.module}/foo.bar"

#   provisioner "local-exec" {
#     command = "echo The content is ${self.content}"
#   }

#   provisioner "local-exec" {
#     command = "abc"
#     on_failure = continue
#   }

#   provisioner "local-exec" {
#     when = destroy
#     command = "echo The deleting filename is ${self.filename}"
#   }
# }

# data "http" "example" {
#   provider = aws-http
#   url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

#   request_headers = {
#     Accept = "application/json"
#   }
# }

# data "aws_ami" "amzn2" {
#   most_recent = true
#   owners = ["amazon"]

#   filter {
#     name = "owner-alias"
#     values = ["amazon"]
#   }

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
#   }
# }

# Data source to retrieve the existing Route 53 hosted zone for chungyun.net
data "aws_route53_zone" "chungyun_net" {
  name         = "chungyun.net."
  private_zone = false
}