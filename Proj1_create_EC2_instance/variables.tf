variable "region" {
  description = "AWS regon to deloy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Tag Name for the EC2 Instance"
  type        = string
  default     = "My-Fist-Instance"

}

variable "security_group_name" {
  description = "Tag Name for the Security Group"
  type        = string
  default     = "Allow-SSH"
}
