#Calling VPC module
module "VPC" {
  source               = "./modules/VPC"
  cidr_block           = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  name                 = "My-VPC"
  project_name         = "My-VPC"
}

#Caling EC2 modue

module "EC2" {
  source = "./modules/EC2"

  ami_id        = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_pair_name = "TerraformProj"
  subnet_id     = module.VPC.public_subnet_id

}
