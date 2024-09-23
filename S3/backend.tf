terraform {
  backend "s3" {
    bucket = "tf02-macer-park-tfstate"
    key = "terraform/S3/terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
    dynamodb_endpoint = "terraform-lock"
  }
}