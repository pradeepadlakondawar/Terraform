output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.Terraform_VPC.id
}

output "public_ip" {
  description = "The public IP of the created EC2 instance"
  value       = aws_instance.Terraform_VPC.public_ip
}
