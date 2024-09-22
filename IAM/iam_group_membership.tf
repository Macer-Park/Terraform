resource "aws_iam_group_membership" "macerpark" {
  name = aws_iam_group.macerpark-group.name

  users = [
    aws_iam_user.gildong_hong.name
  ]

  group = aws_iam_group.macerpark-group.name
}