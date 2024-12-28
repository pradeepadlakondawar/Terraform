variable "public_subnet_id" {
  description = "The ID of the public subnet where the NAT Gateway will be created"
  type        = string
}

variable "tags" {
  description = "Tags for the NAT Gateway and Elastic IP"
  type        = map(string)
}
