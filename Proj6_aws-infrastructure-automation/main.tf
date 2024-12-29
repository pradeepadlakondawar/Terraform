#vpc
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "main-vpc"
}

#subnet

module "subnet" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  private_cidr_block = "10.0.2.0/24"
  public_cidr_block  = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

# Security-group

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

#Internet gateway

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

#Route table

module "route_table" {
  source              = "./modules/route-table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.subnet.public_subnet_id
  private_subnet_id   = module.subnet.private_subnet_id
}

#IAM role
module "iam_role" {
  source     = "./modules/iam-role"
  role_name  = "web-server-role"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess" #  (Replace with the policy you need)
}
# ec2 instance

module "ec2_instance" {
  source              = "./modules/ec2-instance"
  ami_id              = "ami-0e2c8caa4b6378d8c"
  instance_type       = "t2.micro"
  subnet_id           = module.subnet.public_subnet_id
  security_group_id   = module.security_group.security_group_id
  iam_role_arn        = module.iam_role.instance_profile_name
  key_name            = "TerraformProj"
  associate_public_ip = true
  user_data           = "#!/bin/bash\nsudo apt-get update -y\nsudo apt-get install -y nginx"
  name                = "web-server"
  volume_size         = 10
  availability_zone   = "us-east-1a"
  ebs_size            = 20

}
