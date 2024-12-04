locals {
  # route-tables = { for k, v in var.vpcs : k => { "${k}-rt" = { ssh-port = "22", cidr = "0.0.0.0/0", protocol = "tcp" }, "${k}-sg-lb" = { sg-name = "${k}-sg-lb" } } }
  australia-rt  = { public = {} }
  california-rt = { public = {} }
  hong-kong-rt  = { public = {} }
  london-rt     = { public = {} }
  new-york-rt   = { public = {} }
  sao-paulo-rt  = { public = {} }
  tokyo-rt = { private = {}
  public = {} }
}

resource "aws_route_table" "_1" {
  for_each = local.australia-rt
  provider = aws.australia
  vpc_id   = aws_vpc.australia-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.australia-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.australia-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_1-rt-assoc" {
  for_each  = var.australia-subnets
  provider  = aws.australia
  subnet_id = aws_subnet._1[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._1["private"].id : aws_route_table._1["public"].id
}

resource "aws_route_table" "_2" {
  for_each = local.california-rt
  provider = aws.california
  vpc_id   = aws_vpc.california-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.california-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.california-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_2-rt-assoc" {
  for_each  = var.california-subnets
  provider  = aws.california
  subnet_id = aws_subnet._2[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._2["private"].id : aws_route_table._2["public"].id
}

resource "aws_route_table" "_3" {
  for_each = local.hong-kong-rt
  provider = aws.hong-kong
  vpc_id   = aws_vpc.hong-kong-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.hong-kong-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.hong-kong-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_3-rt-assoc" {
  for_each  = var.hong-kong-subnets
  provider  = aws.hong-kong
  subnet_id = aws_subnet._3[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._3["private"].id : aws_route_table._3["public"].id
}

resource "aws_route_table" "_4" {
  for_each = local.london-rt
  provider = aws.london
  vpc_id   = aws_vpc.london-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.london-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.london-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_4-rt-assoc" {
  for_each  = var.london-subnets
  provider  = aws.london
  subnet_id = aws_subnet._4[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._4["private"].id : aws_route_table._4["public"].id
}

resource "aws_route_table" "_5" {
  for_each = local.new-york-rt
  provider = aws.new-york
  vpc_id   = aws_vpc.new-york-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.new-york-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.new-york-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_5-rt-assoc" {
  for_each  = var.new-york-subnets
  provider  = aws.new-york
  subnet_id = aws_subnet._5[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._5["private"].id : aws_route_table._5["public"].id
}

resource "aws_route_table" "_6" {
  for_each = local.sao-paulo-rt
  provider = aws.sao-paulo
  vpc_id   = aws_vpc.sao-paulo-vpc.id

  route {
    cidr_block = var.route-table-cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.sao-paulo-nat.id : ""
    gateway_id = each.key == "public" ? aws_internet_gateway.sao-paulo-igw.id : ""
  }

  tags = {
    Name = each.key
  }
}

resource "aws_route_table_association" "_6-rt-assoc" {
  for_each  = var.sao-paulo-subnets
  provider  = aws.sao-paulo
  subnet_id = aws_subnet._6[each.key].id
  # route_table_id = aws_route_table.private.id
  route_table_id = endswith(each.key, "private") ? aws_route_table._6["private"].id : aws_route_table._6["public"].id
}

resource "aws_route_table" "_7" {
  for_each = local.tokyo-rt
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo-vpc.id

  route {
    cidr_block     = var.route-table-cidr
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

