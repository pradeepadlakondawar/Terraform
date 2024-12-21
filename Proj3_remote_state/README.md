## Project 3: Handling Remote State with S3 and DynamoDB

### Overview

This project demonstrates how to handle remote state using an S3 bucket and DynamoDB table. It utilizes the resources created in **Proj2** (S3 bucket for storing Terraform state and DynamoDB table for state locking) to manage Terraform's state remotely and prevent concurrent state modifications.

### Resources

- **S3 Bucket**: Stores the Terraform state file.
- **DynamoDB Table**: Handles state locking to ensure only one user modifies the state at a time.

### Prerequisites

Before using this Terraform configuration, ensure you have the following:

- The **S3 bucket** and **DynamoDB table** created in **Proj2** for state management.
- Terraform installed on your local machine.
- AWS CLI configured with access to your AWS account or AWS credentials set in the environment.

### Terraform Configuration Files

1. **provider.tf**: Configures the AWS provider and sets the region for the resources.
2. **main.tf**: Defines an EC2 instance for demonstration purposes.
3. **backend.tf**: Configures the remote backend to store the state file in the S3 bucket and use DynamoDB for state locking.

### Variables

The following variables are used in the configuration:

- `region`: The AWS region where the resources are deployed (e.g., `us-east-1`).
- `ami`: The Amazon Machine Image ID used to launch the EC2 instance.
- `instance_type`: The instance type for the EC2 instance (e.g., `t2.micro`).

### How to Use

1. **Initialize Terraform**:

   First, initialize the Terraform working directory to configure the backend and download the necessary provider plugins:

   ```bash
   terraform init
   ```

   This will configure the remote backend (S3) and state locking (DynamoDB).

2. **Review the Plan**:

   You can review the execution plan before applying any changes:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:

   To create the EC2 instance, run:

   ```bash
   terraform apply
   ```

   Terraform will prompt you to confirm. Type `yes` to proceed.

4. **Verify Resources**:

   After the `terraform apply` completes, you can verify the creation of the EC2 instance from the AWS Management Console.

### Outputs

If you want to output the EC2 instance ID, you can add the following `output.tf`:

```hcl
output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.terraform_instance.id
}
```

### Remote State Management

With this setup, the state file will be stored remotely in the S3 bucket (`my-terraform-state-bucket-unique-11559988`), and the DynamoDB table (`terraform-lock-table`) will be used to prevent concurrent modifications. The state file path will be defined as `terraform/state.tfstate` in the S3 bucket.

### Cleanup

To destroy the resources created by Terraform, you can run:

```bash
terraform destroy
```

This will remove all the resources managed by the current Terraform configuration, including the EC2 instance.
