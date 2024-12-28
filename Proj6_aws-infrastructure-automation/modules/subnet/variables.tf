variable "vpc_id" {
  description = "The VPC ID where the subnets will be created"
  type        = string
}

variable "public_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnets"
  type        = string
}
