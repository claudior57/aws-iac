variable "tags" {
  type = map(any)
  default = {
    Team        = "DevOps"
    Environment = "Staging"
    Purpose     = "Basic cloud foundation setup"
    Terraform   = "true"
  }
}
variable "vpc_name" {
  default = "staging"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "azs_list" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
variable "public_subnet_tags" {
  type = map(any)
  default = {
    Team        = "DevOps"
    Environment = "Staging"
    Terraform   = "true"
  }
}

variable "private_subnet_tags" {
  type = map(any)
  default = {
    Team        = "DevOps"
    Environment = "Staging"
    Terraform   = "true"
  }
}