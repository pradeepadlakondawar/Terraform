output "vpc_id" {
  value = module.VPC.vpc_id
}
output "instance_id" {
  value = module.EC2.instance_id
}

output "instance_public_ip" {
  value = module.EC2.public_ip
}
