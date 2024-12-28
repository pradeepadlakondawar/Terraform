variable "cidr_block" {
  description = "CIDR block for the vpc"
  type        = string
}

variable "name" {
  description = "Name for the VPC"
  type        = string
  default     = "main-vpc"
}
