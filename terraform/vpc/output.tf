output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "nat_public_ips" {
  description = "Public Elastic IPs list"
  value       = module.vpc.nat_public_ips
}

output "private_subnets_cidr_blocks" {
  description = "Cidr subnet List"
  value       = var.private_subnets
}

# Subnets ids
output "public_subnets" {
  description = "List of public subnets IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnets IDs"
  value       = module.vpc.private_subnets
}