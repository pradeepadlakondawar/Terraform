# modules/ec2-instance/outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

output "ebs_volume_id" {
  description = "The ID of the attached EBS volume"
  value       = aws_ebs_volume.data.id
}
