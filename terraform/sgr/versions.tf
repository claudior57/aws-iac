terraform {
  backend "s3" {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/sgr-staging.tfstate"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/vpc-staging.tfstate"
  }
}