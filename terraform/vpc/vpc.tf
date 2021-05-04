module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"
  name    = var.vpc_name
  cidr    = var.cidr_block
  azs     = var.azs_list

  private_subnets                    = var.private_subnets
  public_subnets                     = var.public_subnets
  create_database_subnet_route_table = true

  tags                 = var.tags
  public_subnet_tags   = var.public_subnet_tags
  private_subnet_tags  = var.private_subnet_tags
  single_nat_gateway   = true
  enable_nat_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true
}
