# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# Resource: Create an EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Demo"
  }
}
