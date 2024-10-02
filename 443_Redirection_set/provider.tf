terraform {
  cloud {
    organization = "Project_Macer"
    workspaces {
      name = "Oscar-macer-test-workspace"
    }
  }
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.46"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}