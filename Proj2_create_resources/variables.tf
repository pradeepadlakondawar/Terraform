variable "region" {
  description = "This defines region for aws"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for storing te Terraform state"
  type        = string
  default     = "my-terraform-state-bucket-unique-11559988"
}

variable "dynamodb_table_name" {
  default = "terraform-lock-table"
}
