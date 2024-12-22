resource "aws_instance" "Terraform_VPC" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "My-EC2-Instance"
  }
}
