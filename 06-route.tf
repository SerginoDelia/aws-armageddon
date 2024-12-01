locals {
  tokyo-rt = {
    private = {
      cidr = "0.0.0.0/0"
    }
    public = {
      cidr = "0.0.0.0/0"
    }
  }
}

resource "aws_route_table" "_7" {
  for_each = local.tokyo-rt
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo-vpc.id


  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = each.key == "private" ? aws_nat_gateway.tokyo-nat.id : ""
    # gateway_id = aws_internet_gateway.tokyo-igw.id
    gateway_id = each.key == "public" ? aws_internet_gateway.tokyo-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_7-rt-assoc" {
  # aws_subnet._7["tokyo-a-private"]
  for_each  = var.tokyo-subnets
  provider  = aws.tokyo
  subnet_id = aws_subnet._7[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._7["private"].id : aws_route_table._7["public"].id
}


# resource "aws_route_table_association" "private-eu-west-1a" {
#   subnet_id      = aws_subnet.private-eu-west-1a.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route_table_association" "private-eu-west-1b" {
#   subnet_id      = aws_subnet.private-eu-west-1b.id
#   route_table_id = aws_route_table.private.id
# }
# resource "aws_route_table_association" "private-eu-west-1c" {
#   subnet_id      = aws_subnet.private-eu-west-1c.id
#   route_table_id = aws_route_table.private.id
# }


# #public

# resource "aws_route_table_association" "public-eu-west-1a" {
#   subnet_id      = aws_subnet.public-eu-west-1a.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public-eu-west-1b" {
#   subnet_id      = aws_subnet.public-eu-west-1b.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public-eu-west-1c" {
#   subnet_id      = aws_subnet.public-eu-west-1c.id
#   route_table_id = aws_route_table.public.id
# }


# test

