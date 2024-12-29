terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-11559988" # Bucket created in Project 2 
    key            = "terraform/state.tfstate"                   # Path to store the state file
    region         = "us-east-1"                                 # Match the region of S3
    dynamodb_table = "terraform-lock-table"                      # DynamoDB table created in Project 2
    encrypt        = true
  }
}
