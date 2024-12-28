provider "aws" {
  region = var.region
}

# callig vpc

module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = "10.0.0.0/16"
  dns_support   = true
  dns_hostnames = true
  tags = {
    Name = "Myvpc"
  }
}

# calling subnet
module "subnet" {
  source          = "./modules/subnet"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
  tags = {
    Name = "Mysubnets"
  }

}

#callin igw

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  tags = {
    igw-name = "MyInternetGateway"
  }
}

module "nat" {
  source           = "./modules/nat"
  public_subnet_id = module.subnet.private_subnet_ids[0]
  tags = {
    Name = "MyNATGateway"
  }
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {
    Name = "webSecurityGroup"
  }
}
