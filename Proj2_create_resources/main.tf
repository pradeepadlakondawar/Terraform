provider "aws" {
  region = var.region
}

# Create S3 bucket for remote backend

resource "aws_s3_bucket" "terraform_S3_state" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform State Bucket 11559988"
    Environment = "Dev"
  }
}

# Enable server-side encryption for the s3 bucket

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_S3_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Crate DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  # Defining the primary key (partition key) for the table
  hash_key = "LockID"

  attribute {
    name = "LockID" # Attribute name (partition key)
    type = "S"      #Indicates the data type for the attribute (S for String).
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
  }
}


