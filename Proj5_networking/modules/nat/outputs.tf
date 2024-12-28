output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "elastic_ip_id" {
  description = "The ID of the Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nat.id
}
