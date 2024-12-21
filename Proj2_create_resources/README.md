## Project 2: Remote State Management with S3 and DynamoDB

### Overview

This project demonstrates how to set up remote state management for Terraform by creating an S3 bucket for storing the state file and a DynamoDB table for state locking. These resources help manage Terraform's state across multiple users and prevent concurrent modifications.

### Resources Created

1. **S3 Bucket**: An S3 bucket is created to store the Terraform state file securely.
2. **DynamoDB Table**: A DynamoDB table is created to implement state locking, preventing multiple users from modifying the state at the same time.

### Prerequisites

Before using this Terraform configuration, ensure you have the following:

- An AWS account with the necessary permissions to create S3 buckets and DynamoDB tables.
- Terraform installed on your local machine.
- AWS CLI configured with access to your AWS account or AWS credentials set in the environment.

### Terraform Configuration Files

1. **provider.tf**: Configures the AWS provider with the region specified in the `var.region` variable.
2. **main.tf**: Defines resources for the S3 bucket and DynamoDB table for remote state management.

### Variables

The following variables are used in the configuration:

- `region`: The AWS region where the resources will be created (e.g., `us-east-1`).
- `bucket_name`: The name of the S3 bucket to store the Terraform state file.
- `dynamodb_table_name`: The name of the DynamoDB table for state locking.

### How to Use

1. **Initialize Terraform**:

   First, initialize Terraform to download the necessary provider plugins and set up the working directory:

   ```bash
   terraform init
   ```

2. **Review the Plan**:

   You can review the execution plan before applying any changes:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:

   To create the S3 bucket and DynamoDB table, run:

   ```bash
   terraform apply
   ```

   Terraform will prompt you to confirm. Type `yes` to proceed.

4. **Verify Resources**:

   After the `terraform apply` completes, you can verify the creation of the S3 bucket and DynamoDB table from the AWS Management Console.

### Outputs

If you want to output the S3 bucket name and DynamoDB table name, you can add the following `output.tf`:

```hcl
output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.terraform_S3_state.bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.terraform_lock.name
}
```

### Cleanup

To destroy the resources created by Terraform, you can run:

```bash
terraform destroy
```

This will remove all the resources managed by the current Terraform configuration.

---
