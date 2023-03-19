terraform {
  backend "s3" {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "iac_lab"
    key     = "staging/ec2-staging.tfstate"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "iac_lab"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "iac_lab"
    key     = "staging/vpc-staging.tfstate"
  }
}

data "terraform_remote_state" "sgr" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "iac_lab"
    key     = "staging/sgr-staging.tfstate"
  }
}