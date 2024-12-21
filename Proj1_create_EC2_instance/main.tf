# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

#Security Group for SSH access

resource "aws_security_group" "ssh_access" {
  name_prefix = "ssh-access-"
  ingress = [
    {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress = [
    {
      description      = "Allow all egress traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1" # All protocols
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = var.security_group_name
  }
}

# Create EC2 Instance
resource "aws_instance" "my_first_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  #Attach the Security Grup
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = var.instance_name
  }
}
