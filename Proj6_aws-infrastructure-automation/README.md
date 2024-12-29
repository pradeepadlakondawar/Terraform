# AWS Infrastructure Automation with Terraform 🚀

This project demonstrates the automation of AWS infrastructure setup using **Terraform**. The infrastructure includes a VPC, subnets, security groups, EC2 instances, and more, integrated with a **CI/CD pipeline using GitHub Actions**.

---

## **Features Implemented**

1. **VPC and Subnet Configuration**
   - Created a VPC with a CIDR block of `10.0.0.0/16`.
   - Configured both public and private subnets in the `us-east-1a` availability zone.

2. **Internet Gateway and Route Table**
   - Set up an internet gateway for public subnet access.
   - Configured route tables to manage traffic routing between public and private subnets.

3. **Security Groups**
   - Created security groups to control access to the EC2 instances.

4. **IAM Role**
   - Configured an IAM role with `AmazonEC2FullAccess` policy for managing EC2 permissions.

5. **EC2 Instances**
   - Launched an EC2 instance in the public subnet:
     - AMI: `ami-0e2c8caa4b6378d8c`
     - Instance type: `t2.micro`
     - User data script to install NGINX and update the server.

6. **Infrastructure as Code (IaC)**
   - Modularized Terraform code for better reusability and scalability.
   - Modules used for VPC, subnets, security groups, route tables, IAM roles, and EC2 instances.

7. **CI/CD Pipeline**
   - Implemented a GitHub Actions CI/CD pipeline for automating Terraform workflows:
     - Validate, plan, apply, and destroy Terraform configurations.
     - Supports manual triggers and dynamic actions (`plan`, `apply`, or `destroy`).

---

## **Prerequisites**

- AWS Account
- Terraform CLI (v1.5.7 or higher)
- GitHub account with repository secrets for AWS credentials:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`

---

## **Directory Structure**

```plaintext
Proj6_aws-infrastructure-automation/
├── modules/
│   ├── vpc/
│   ├── subnet/
│   ├── security-group/
│   ├── internet-gateway/
│   ├── route-table/
│   ├── iam-role/
│   └── ec2-instance/
├── main.tf
├── backend.tf
├── variables.tf
├── outputs.tf
├── .github/
│   └── workflows/
│       └── terraform-ci-cd.yaml
```

---

## **Getting Started**

### **Step 1: Clone the Repository**
```bash
git clone https://github.com/your-repo-name.git
cd Proj6_aws-infrastructure-automation/
```

### **Step 2: Initialize Terraform**
```bash
terraform init
```

### **Step 3: Validate Terraform Configuration**
```bash
terraform validate
```

### **Step 4: Plan and Apply**
Generate an execution plan:
```bash
terraform plan -out=tfplan
```

Apply the configuration:
```bash
terraform apply -auto-approve tfplan
```

### **Step 5: CI/CD Pipeline**
The CI/CD pipeline automates Terraform workflows:
- Triggered on **push**, **pull request**, or **manual dispatch**.
- Includes steps for `plan`, `apply`, and `destroy`.

To manually trigger the pipeline:
1. Go to the **Actions** tab in your GitHub repository.
2. Select the "Terraform CI/CD Pipeline" workflow.
3. Click "Run workflow" and choose the desired action.

---

## **Modules Used**

1. **VPC Module**
   - Provisions a Virtual Private Cloud (VPC).

2. **Subnet Module**
   - Creates public and private subnets.

3. **Security Group Module**
   - Defines ingress and egress rules.

4. **Internet Gateway Module**
   - Enables internet access for resources in public subnets.

5. **Route Table Module**
   - Manages routing for public and private subnets.

6. **IAM Role Module**
   - Configures an IAM role for EC2 instances.

7. **EC2 Instance Module**
   - Launches an EC2 instance with the specified configuration.

---

## **CI/CD Workflow**
used workflow_dispatch: that allows manual triggering

---

## **Future Enhancements**

1. Add **Load Balancers and Auto Scaling** to improve fault tolerance and scalability.
2. Integrate **RDS** for backend database support.

---

## **Author**

Pradeep Adlakondawar  

Feel free to reach out for suggestions or contributions!
