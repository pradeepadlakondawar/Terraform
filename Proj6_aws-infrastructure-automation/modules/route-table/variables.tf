# modules/route-table/variables.tf
variable "vpc_id" {
  description = "The VPC ID where the route tables will be created"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}
