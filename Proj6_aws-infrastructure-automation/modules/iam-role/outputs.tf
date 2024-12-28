

output "instance_profile_name" {
  description = "The IAM instance profile name"
  value       = aws_iam_instance_profile.instance_profile.name
}

output "instance_profile_arn" {
  description = "The IAM instance profile ARN"
  value       = aws_iam_instance_profile.instance_profile.arn
}
