# resource "local_file" "variable_test" {
#   content  = "lifecycle"
#   filename = var.file_name

#   lifecycle {
#     precondition {
#       condition     = var.file_name == "var_test.txt"
#       error_message = "file_name must be var_test.txt"
#     }
#   }
# }

# resource "local_file" "postcondition_test" {
#   content = ""
#   filename = "postcondition_test.txt"

#   lifecycle {
#     postcondition {
#       condition = self.content != ""
#       error_message = "content cannot empty"
#     }
#   }
# }

# output "postcondition_content" {
#   value = local_file.postcondition_test.id
# }

# resource "local_file" "abc" {
#   content  = "abc!"
#   filename = "abc.txt"
#   #   filename = "${path.module}/abc.txt"
#   lifecycle {
#     create_before_destroy = true
#     ignore_changes = [
#       content
#     ]
#   }
# }

# resource "local_file" "def" {
#   depends_on = [local_file.abc]
#   content    = local_file.abc.content # Inset the value from local_file.abc instead
#   filename   = "def.txt"
#   #   filename = "${path.module}/def.txt"
#   lifecycle {
#     prevent_destroy = false
#   }
# }

# data "local_file" "abc" {
#   filename = local_file.abc.filename
# }

# resource "local_file" "ghi" {
#   content  = data.local_file.abc.content
#   filename = "ghi.txt"
# }

# resource "local_file" "jkl" {
#   content  = var.mypassword
#   filename = "jkl.txt"
# }

# resource "local_file" "mno" {
#   content  = var.my_var
#   filename = "mno.txt"
# }

# resource "local_file" "count_test" {
#   count    = 5
#   content  = "abc!"
#   filename = "count_${count.index}.txt"
# }

# resource "local_file" "list_var" {
#   count    = length(var.names)
#   content  = "abc"
#   filename = "abc-${var.names[count.index]}.txt"
# }

# resource "local_file" "element_var" {
#   count    = length(var.names)
#   content  = local_file.list_var[count.index].content
#   filename = "def-${element(var.names, count.index)}.txt"
# }

# resource "local_file" "for_each_test" {
#   for_each = {
#     a = "content a"
#     b = "content b"
#   }
#   content  = each.value
#   filename = "for_each_${each.key}.txt"
# }

# resource "local_file" "for_each_abc" {
#   for_each = var.each_names
#   content  = each.value
#   filename = "abc-${each.key}.txt"
# }

# resource "local_file" "for_each_def" {
#   for_each = local_file.for_each_abc
#   content  = each.value.content
#   filename = "def-${each.key}.txt"
# }

# resource "local_file" "for_names_abc" {
#   content  = jsonencode(var.for_names)
#   filename = "for_names.txt"
# }

# resource "local_file" "for_names_abc_upper" {
#   content  = jsonencode([for s in var.names : upper(s)])
#   filename = "for_names_with_upper.txt"
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "Terraform-test-vpc"
#   }
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = null
#   }

#   ingress {
#     description      = "HTTP"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = null
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = null
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }

# resource "aws_instance" "foo" {
#   ami           = "ami-0a10b2721688ce9d2"
#   instance_type = "t2.micro"

#   subnet_id = module.aws_vpc.private_subnets[0]
# }

# resource "aws_eip" "bar" {

#   domain     = "vpc"
#   instance   = aws_instance.foo.id
#   depends_on = [module.aws_vpc.aws_internet_gateway]
# }

# resource "null_resource" "barz" {
#   provisioner "remote-exec" {
#     connection {
#       host = aws_eip.bar.public_ip
#     }
#     inline = [
#       "echo ${aws_eip.bar.public_ip}"
#     ]
#   }
# }

# resource "local_file" "b" {
#   content = "foo!"
#   filename = "foo.bar"
# }

# moved {
#   from = local_file.a
#   to = local_file.b
# }

# resource "aws_instance" "terraform_server" {
#   ami = data.aws_ami.amzn2.id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform_server"
#   }
# }


# resource "random_password" "password" {
#   length = 16
#   special = true
#   override_special = "!#$%"
# }

# resource "local_file" "foo" {
#   content = "foo"
#   filename = "${path.module}/foo.txt"
# }