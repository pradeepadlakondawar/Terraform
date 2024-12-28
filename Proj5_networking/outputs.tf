output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_id" {
  value = module.subnet.private_subnet_ids
}

output "internet_gateway_id" {
  value = module.igw.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.nat.nat_gateway_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}
