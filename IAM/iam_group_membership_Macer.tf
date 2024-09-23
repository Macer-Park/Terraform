resource "aws_iam_group_membership" "macerpark" {
  name = aws_iam_group.macerpark-group.name

  users = var.iam_user_list

  group = aws_iam_group.macerpark-group.name
}