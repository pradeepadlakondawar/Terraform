## Project 1: Create EC2 and Attach Security Group

### Overview

This project demonstrates how to create an EC2 instance in AWS and attach a security group to allow SSH access. The security group allows inbound traffic on port 22 (SSH), and the EC2 instance is provisioned with the specified AMI and instance type.

### Prerequisites

Before using this Terraform configuration, ensure you have the following:

- An AWS account with the necessary permissions to create EC2 instances and security groups.
- Terraform installed on your local machine.
- AWS CLI configured with access to your AWS account or AWS credentials set in the environment.

### Resources Created

1. **EC2 Instance**: A new EC2 instance is created with the specified AMI and instance type.
2. **Security Group**: A security group is created with the rule allowing SSH access on port 22 from any IP address (0.0.0.0/0).

### Terraform Configuration Files

1. **provider.tf**: Configures the AWS provider with the region `us-east-1`.
2. **main.tf**: Defines resources for EC2 instance and security group.

### Variables

The following variables are used in the configuration:

- `ami`: The AMI ID for the EC2 instance.
- `instance_type`: The type of EC2 instance (e.g., `t2.micro`).
- `security_group_name`: The name for the security group.
- `instance_name`: The name for the EC2 instance.

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

   To create the EC2 instance and security group, run:

   ```bash
   terraform apply
   ```

   Terraform will prompt you to confirm. Type `yes` to proceed.

4. **Verify Resources**:

   After the `terraform apply` completes, you can verify the creation of the EC2 instance and security group from the AWS Management Console.

### Outputs

If you want to output the EC2 instance ID and security group ID, you can add the following `output.tf`:

```hcl
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.my_first_instance.id
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.ssh_access.id
}
```

### Cleanup

To destroy the resources created by Terraform, you can run:

```bash
terraform destroy
```

This will remove all the resources managed by the current Terraform configuration.

---
