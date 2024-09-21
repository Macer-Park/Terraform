resource "aws_iam_role" "hello" {
  name = "hello-iam-role"
  path = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF

}

resource "aws_iam_role_policy" "hello_s3" {
  name = "hello-s3-download"
  role = aws_iam_role.hello.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement":[
    {
        "Sid": "AllowUserToSeeBucketListInTheConsole",
        "Action": [
        "s3:GetObject"
        ],
        "Resource": [
            "*"
        ],
        "Effect": "Allow"
        }
    ]
}
EOF

}

resource "aws_iam_instance_profile" "hello" {
  name = "hello-profile"
  role = aws_iam_role.hello.name
}