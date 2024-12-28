variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group attached to the EC2 instance"
  type        = string
}

variable "iam_role_arn" {
  description = "The IAM role ARN to associate with the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair to access the EC2 instance"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with the instance"
  type        = bool
}

variable "user_data" {
  description = "The user data script to run on instance start"
  type        = string
}

variable "volume_size" {
  description = "The size of the root EBS volume"
  type        = number
  default     = 8
}

variable "availability_zone" {
  description = "The availability zone in which the EBS volume will be created"
  type        = string
}

variable "ebs_size" {
  description = "The size of the additional EBS volume"
  type        = number
  default     = 20
}

variable "name" {
  description = "The name of the EC2 instance"
  type        = string
}
