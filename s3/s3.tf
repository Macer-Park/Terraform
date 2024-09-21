resource "aws_s3_bucket" "main" {
  bucket = "macerpark-terraform-101"

  tags = {
    Name = "macerpark-terraform-101"
  }
}