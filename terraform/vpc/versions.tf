terraform {
  backend "s3" {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "iac_lab"
    key     = "staging/vpc-staging.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "iac_lab"
}
