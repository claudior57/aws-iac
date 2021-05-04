terraform {
  backend "s3" {
    bucket  = "iaclab-terraform-states"
    region  = "us-east-1"
    profile = "default"
    key     = "staging/vpc-staging.tfstate"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
