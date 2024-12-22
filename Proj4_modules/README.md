# Terraform Project: Modular Infrastructure Deployment

This project demonstrates a modular approach to deploying AWS infrastructure using Terraform. It includes modules for creating a VPC and launching an EC2 instance within the VPC.

---

## **Project Structure**

Proj4_modules/
├── main.tf # Root module to call child modules
├── variables.tf # Input variables for the root module
├── outputs.tf # Outputs for the root module
├── modules/
│ ├── VPC/
│ │ ├── main.tf # VPC module configuration
│ │ ├── variables.tf # Input variables for VPC module
│ │ ├── outputs.tf # Outputs for VPC module
│ ├── EC2/
│ ├── main.tf # EC2 module configuration
│ ├── variables.tf # Input variables for EC2 module
│ ├── outputs.tf # Outputs for EC2 module

````

---

## **Modules**

### **VPC Module**
This module sets up the Virtual Private Cloud (VPC) and related components.
- **Creates**:
  - VPC with a CIDR block.
  - Public subnet.
  - Internet Gateway (IGW) with a route table for Internet access.
- **Inputs**:
  - `vpc_cidr` - CIDR block for the VPC.
  - `public_subnet_cidr` - CIDR block for the public subnet.
- **Outputs**:
  - VPC ID.
  - Public Subnet ID.

---

### **EC2 Module**
This module launches an EC2 instance within the VPC created by the VPC module.
- **Creates**:
  - EC2 instance.
  - Security group allowing SSH access.
- **Inputs**:
  - `instance_type` - EC2 instance type (e.g., `t2.micro`).
  - `ami_id` - AMI ID for the instance.
  - `key_pair` - Key pair for SSH access.
  - `subnet_id` - ID of the subnet where the instance will be launched.
- **Outputs**:
  - EC2 instance ID.
  - Public IP address of the EC2 instance.

---

## **Usage**

### **Step 1: Configure Variables**
Define the necessary variables in `variables.tf` files for both the root module and submodules. Example:

**Root Module (`variables.tf`):**
```hcl
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-12345678"
}

variable "key_pair" {
  default = "my-key-pair"
}
````

---

### **Step 2: Initialize Terraform**

Run the following command to initialize the project:

```bash
terraform init
```

---

### **Step 3: Plan and Apply**

1. **Plan the Infrastructure:**
   ```bash
   terraform plan
   ```
2. **Apply the Configuration:**
   ```bash
   terraform apply
   ```
3. Confirm with `yes` to deploy the resources.

---

### **Step 4: Verify Resources**

- Check the AWS Management Console to verify:
  - VPC and subnet creation under the **VPC** section.
  - EC2 instance under the **EC2** section.
  - Security group under the **Security Groups** section.
- Run `terraform output` to confirm:
  - Public Subnet ID.
  - EC2 Instance ID.
  - Public IP of the EC2 instance.

---

## **Outputs**

After applying, the following outputs will be available:

- **VPC Module**:
  - VPC ID.
  - Public Subnet ID.
- **EC2 Module**:
  - EC2 Instance ID.
  - Public IP address.

---

## **Best Practices**

1. **Modular Design**: Use separate modules for reusable and organized code.
2. **Remote State**: Use a remote backend (e.g., S3) for state management.
3. **Tags**: Tag all resources for better identification and management.
4. **Security**:
   - Limit security group access (e.g., restrict SSH to specific IPs).
   - Use unique key pairs for each deployment.
5. **IAM Permissions**:
   - Ensure the user/role running Terraform has sufficient permissions for:
     - VPC creation.
     - Subnet creation.
     - EC2 instance and security group creation.

---

## **Common Errors and Troubleshooting**

### **Error: Unsupported Attribute**

- Cause: Incorrect reference to module outputs.
- Solution: Verify the output names in the respective `outputs.tf` files.

### **Error: Reference to Undeclared Resource**

- Cause: Missing resource in the module definition.
- Solution: Ensure the required resources are declared in the module.

### **Error: Permission Denied**

- Cause: Insufficient IAM permissions.
- Solution: Verify the IAM policy attached to your user/role.

---

## **Cleanup**

To destroy all resources created by this project:

```bash
terraform destroy
```

Confirm with `yes`.

---

## **Contact**

For any issues or questions, feel free to reach out!

---

```

Let me know if you’d like to tweak any section or add more details!
```
