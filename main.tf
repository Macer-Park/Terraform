resource "local_file" "abc" {
  content = "lifecycle - step 3"
  filename = "${path.module}/abc.txt"

  lifecycle {
    prevent_destroy = true
  }
}

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