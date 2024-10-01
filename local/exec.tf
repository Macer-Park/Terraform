# resource "null_resource" "example1" {
#   provisioner "local-exec" {
#     command = <<EOF
#     echo Hello!! > file.txt
#     echo $ENV >> file.txt
#     EOF

#     interpreter = ["bash", "-c"]

#     working_dir = "/tmp"

#     environment = {
#       ENV = "world!!"
#     }
#   }
# }

# resource "null_resource" "example1" {
#   connection {
#     type = "ssh"
#     user = "root"
#     password = var.root_password
#     host = var.host
#   }

#   provisioner "file" {
#     source = "conf/myapp.conf"
#     destination = "/etc/myapp.conf"
#   }

#   provisioner "file" {
#     source = "conf/myapp.conf"
#     destination = "C:/App/myapp.conf"

#     connection {
#       type = "winrm"
#       user = "Administrator"
#       password = var.admin_password
#       host = var.host
#     }
#   }
# }