terraform {
  backend "s3" {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/cloudwatch-staging.tfstate"
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

data "terraform_remote_state" "sgr" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/sgr-staging.tfstate"
  }
}

data "terraform_remote_state" "sns" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/sns-staging.tfstate"
  }
}
data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/ec2-staging.tfstate"
  }
}