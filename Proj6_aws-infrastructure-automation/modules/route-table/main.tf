resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  # You can add routing rules based on your architecture. For now, we will assume no direct internet access.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id # Add only if private subnets need internet access
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}
