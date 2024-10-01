terraform {
  # cloud {

  #   organization = "Project_Macer"

  #   workspaces {
  #     name = "Oscar-macer-test-workspace"
  #   }
  # }
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.46"
    }
    # architect-http = { #Yet Not Supported on Apple Silicon
    #   source = "architect-team/http"
    # }
    # http = {
    #   source = "hashicorp/http"
    # }
    # aws-http = {
    #   source = "terraform-aws-modules/http"
    # }
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 3.0.0"
    # }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}