resource "local_file" "step7" {
  content = ""
  filename = "${path.module}/step7.txt"

  lifecycle {
    postcondition {
      condition = self.content != ""
      error_message = "content cannot empty"
    }
  }
}

# variable "file_name" {
#   default = "step0.txt"
# }

# resource "local_file" "step6" {
#   content = "lifecycle - step 6"
#   filename = "${path.module}/${var.file_name}"

#   lifecycle {
#     precondition {
#       condition = var.file_name == "step6.txt"
#       error_message = "file name is not \"step6.txt\""
#     }
#   }
# }

# resource "local_file" "abc" {
#   content = "lifecycle - step 5"
#   filename = "${path.module}/abc.txt"

#   lifecycle {
#     ignore_changes = [ 
#       content
#      ]
#   }
# }

# resource "local_file" "abc" {
#   content = "lifecycle - step 4"
#   filename = "${path.module}/abc.txt"

#   lifecycle {
#     ignore_changes = [  ]
#   }
# }

# resource "local_file" "abc" {
#   content = "lifecycle - step 3"
#   filename = "${path.module}/abc.txt"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "local_file" "abc" {
#   content = "lifecycle - step 2"
#   filename = "${path.module}/abc.txt"

#   lifecycle {
#     create_before_destroy = true
#   }
# }
# resource "local_file" "abc" {
#   content = "lifecycle - step 1"
#   filename = "${path.module}/abc.txt"

#   lifecycle {
#     create_before_destroy = false
#   }
# }

# resource "local_file" "abc" {
#   content  = "abc!"
#   filename = "${path.module}/abc.txt"
# }

# resource "local_file" "def" {
#   content = "def!"
#   filename = "${path.module}/def.txt"
# }