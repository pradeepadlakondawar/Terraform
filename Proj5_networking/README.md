# Proj5_Networking

This project demonstrates the modularized implementation of a complete networking setup using Terraform. The setup includes VPC, subnets, Internet Gateway, NAT Gateway, and Security Groups. Each component is designed as a reusable module to ensure scalability, maintainability, and ease of use.

---

## **Project Structure**

```
Proj5_Networking/
├── main.tf            # Root module to call all child modules
├── variables.tf       # Input variables for the root module
├── outputs.tf         # Outputs for the root module
├── terraform.tfvars   # Variable definitions file
├── modules/
│   ├── vpc/
│   │   ├── main.tf         # VPC module configuration
│   │   ├── variables.tf    # Input variables for the VPC module
│   │   ├── outputs.tf      # Outputs for the VPC module
│   ├── subnet/
│   │   ├── main.tf         # Subnet module configuration
│   │   ├── variables.tf    # Input variables for the Subnet module
│   │   ├── outputs.tf      # Outputs for the Subnet module
│   ├── igw/
│   │   ├── main.tf         # Internet Gateway module configuration
│   │   ├── variables.tf    # Input variables for the Internet Gateway module
│   │   ├── outputs.tf      # Outputs for the Internet Gateway module
│   ├── nat/
│   │   ├── main.tf         # NAT Gateway module configuration
│   │   ├── variables.tf    # Input variables for the NAT Gateway module
│   │   ├── outputs.tf      # Outputs for the NAT Gateway module
│   ├── sg/
│   │   ├── main.tf         # Security Group module configuration
│   │   ├── variables.tf    # Input variables for the Security Group module
│   │   ├── outputs.tf      # Outputs for the Security Group module
```

---

## **Modules Overview**

### **VPC Module**
- Creates a Virtual Private Cloud (VPC).
- Inputs:
  - CIDR block
  - Tags
- Outputs:
  - VPC ID

### **Subnet Module**
- Creates public and private subnets within the VPC.
- Inputs:
  - VPC ID
  - CIDR blocks for public and private subnets
  - Tags
- Outputs:
  - Public subnet IDs
  - Private subnet IDs

### **Internet Gateway (IGW) Module**
- Attaches an Internet Gateway to the VPC.
- Inputs:
  - VPC ID
  - Tags
- Outputs:
  - Internet Gateway ID

### **NAT Gateway Module**
- Creates NAT Gateways in public subnets for private subnet internet access.
- Inputs:
  - Subnet ID
  - Elastic IP
  - Tags
- Outputs:
  - NAT Gateway ID

### **Security Group (SG) Module**
- Creates security groups for controlling inbound and outbound traffic.
- Inputs:
  - Ingress and egress rules
  - VPC ID
  - Tags
- Outputs:
  - Security Group ID

---

## **Steps to Run**

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Validate Configuration**
   ```bash
   terraform validate
   ```

3. **Generate an Execution Plan**
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**
   ```bash
   terraform apply
   ```

5. **Destroy the Resources (if needed)**
   ```bash
   terraform destroy
   ```

---

## **Input Variables**

The `terraform.tfvars` file defines the following input variables:

```hcl
vpc_cidr          = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
tags              = {
  "Environment" = "Development"
  "Owner"       = "Pradeep"
}
```

---

## **Outputs**

The root module provides the following outputs:

- VPC ID
- Public Subnet IDs
- Private Subnet IDs
- Internet Gateway ID
- NAT Gateway IDs
- Security Group IDs

---

## **Best Practices**

1. Use meaningful tags for resources for better management.
2. Modularize your code to improve scalability and reusability.
3. Validate configurations before applying changes.
4. Follow AWS best practices for subnet design (e.g., public and private subnets across multiple availability zones).

---

## **Common Errors and Troubleshooting**

1. **Invalid Index in Resource Attributes**:
   - Ensure keys exist in maps passed as variables.
   - Validate inputs before applying configurations.

2. **Unsupported Attribute**:
   - Check resource names and outputs in the child modules.
   - Ensure resources are properly referenced in the root module.

3. **Conflicting Resource Dependencies**:
   - Use `depends_on` to resolve resource creation order issues.

4. **Permission Errors**:
   - Ensure your IAM user/role has the required permissions to create and manage AWS resources.

---

## **IAM Permissions Required**

The user running Terraform should have the following permissions:
- `ec2:CreateVpc`
- `ec2:CreateSubnet`
- `ec2:CreateInternetGateway`
- `ec2:AttachInternetGateway`
- `ec2:CreateNatGateway`
- `ec2:CreateSecurityGroup`
- `ec2:AuthorizeSecurityGroupIngress`
- `ec2:AuthorizeSecurityGroupEgress`

---

Feel free to extend or modify this project as needed! 😊