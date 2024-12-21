provider "aws" {
  region = var.region
}

resource "aws_instance" "terraform_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Remote State Example"
  }
}
