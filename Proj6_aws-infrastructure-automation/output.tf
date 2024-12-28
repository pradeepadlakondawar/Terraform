# outputs.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.subnet.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.subnet.private_subnet_id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security_group.security_group_id
}
