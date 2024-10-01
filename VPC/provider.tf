terraform {
  cloud {

    organization = "Project_Macer"

    workspaces {
      name = "Oscar-macer-test-workspace"
    }
  }
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}