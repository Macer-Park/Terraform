resource "aws_s3_bucket" "main" {
  bucket = "cloudnetworking-with-hashicorp"

  tags = {
    Name = "cloudnetworking-with-hashicorp"
  }
}

