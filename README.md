# Terraform Projects

This repository contains multiple Terraform projects that demonstrate various AWS infrastructure automation tasks. The projects include the creation of resources like EC2 instances, S3 buckets, DynamoDB tables, and implementing remote state management using AWS services.

---

## Table of Contents

1. [Proj1 - Create EC2 Instance and Attach Security Group](#proj1-create-ec2-instance-and-attach-security-group)
2. [Proj2 - Create S3 Bucket and DynamoDB for State Management](#proj2-create-s3-bucket-and-dynamodb-for-state-management)
3. [Proj3 - Handle Remote State with S3 and DynamoDB](#proj3-handle-remote-state-with-s3-and-dynamodb)

---

## Proj1 - Create EC2 Instance and Attach Security Group

### Overview

This project demonstrates how to create an EC2 instance in AWS and attach a security group that allows SSH access to the instance.

### Resources

- **Security Group**: Allows SSH access on port 22.
- **EC2 Instance**: A simple EC2 instance created using a specified AMI and instance type.

### Files

- **main.tf**: Contains the Terraform configuration for AWS provider, EC2 instance, and security group.
- **variables.tf**: Defines the variables used in the project.
- **output.tf**: Outputs the EC2 instance ID.

### Steps to Use

1. **Initialize Terraform**:

   ```bash
   terraform init
   ```

2. **Review the Plan**:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:

   ```bash
   terraform apply
   ```

4. **Verify Resources**: Check the EC2 instance and security group in the AWS Console.

---

## Proj2 - Create S3 Bucket and DynamoDB for State Management

### Overview

This project demonstrates how to create an S3 bucket for storing Terraform state files and a DynamoDB table for state locking to prevent concurrent state changes.

### Resources

- **S3 Bucket**: Used to store the Terraform state files.
- **DynamoDB Table**: Used for state locking to avoid concurrent Terraform operations.

### Files

- **main.tf**: Defines the S3 bucket and DynamoDB table.
- **variables.tf**: Defines the variables like region, bucket name, etc.
- **output.tf**: Optionally outputs the names of the resources created.

### Steps to Use

1. **Initialize Terraform**:

   ```bash
   terraform init
   ```

2. **Review the Plan**:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:

   ```bash
   terraform apply
   ```

4. **Verify Resources**: Check the created S3 bucket and DynamoDB table in the AWS Console.

---

## Proj3 - Handle Remote State with S3 and DynamoDB

### Overview

This project demonstrates how to handle remote state by storing the state file in an S3 bucket and using DynamoDB for state locking. The resources created in **Proj2** (S3 bucket and DynamoDB table) are used for remote state management.

### Resources

- **EC2 Instance**: Created as an example resource to test the remote state management.
- **S3 Bucket**: Used for storing the Terraform state file.
- **DynamoDB Table**: Used for state locking to prevent concurrent state modifications.

### Files

- **main.tf**: Creates an EC2 instance to demonstrate the use of remote state.
- **backend.tf**: Configures the S3 bucket and DynamoDB table as the backend for Terraform state storage and locking.
- **variables.tf**: Defines the variables for AMI, instance type, and region.
- **output.tf**: Outputs the instance ID.

### Steps to Use

1. **Initialize Terraform**:

   ```bash
   terraform init
   ```

2. **Review the Plan**:

   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:

   ```bash
   terraform apply
   ```

4. **Verify Resources**: Check the EC2 instance created in the AWS Console.

---

## Common Steps to Setup

### Prerequisites

- Ensure AWS CLI is configured with appropriate IAM permissions.
- Terraform is installed on your machine.
- Ensure that the S3 bucket and DynamoDB table are created in **Proj2** before running **Proj3** for remote state management.

### Variables

Each project uses a set of variables, which can be defined in `variables.tf`. These include the AWS region, instance AMI, instance type, and other resources specific to the project.

```hcl
variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

---

## Cleanup

To destroy all resources created by the Terraform configurations:

```bash
terraform destroy
```

---

## Conclusion

These projects provide a foundation for managing AWS infrastructure using Terraform, including creating EC2 instances, setting up remote state management, and using DynamoDB for state locking. Modify and extend these configurations to suit your own infrastructure needs.
