resource "aws_subnet" "public" {
  for_each = toset(var.public_subnets)

  vpc_id                  = var.vpc_id
  cidr_block              = each.key
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "PublicSubnet-${each.key}" })
}

resource "aws_subnet" "private" {
  for_each = toset(var.private_subnets)

  vpc_id     = var.vpc_id
  cidr_block = each.key
  tags       = merge(var.tags, { Name = "PrivateSubnet-${each.key}" })
}
