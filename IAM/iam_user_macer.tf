resource "aws_iam_user" "macer_park" {
  name = "macer.park"
}

resource "aws_iam_user_policy" "macerpark-blue" {
  name = "super-admin"
  user = aws_iam_user.macer_park.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF

}
