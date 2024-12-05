locals {
  route-tables = { for k, v in var.network.vpcs : k => { "${k}" = { ssh-port = "22",
  cidr = "0.0.0.0/0", protocol = "tcp" } } }


  # route-tables = { for k, v in var.network.vpcs : k => { "${k}" = { ssh-port = "22",
  # cidr = "0.0.0.0/0", protocol = "tcp" }, "${k}-sg-lb" = { sg-name = "${k}-sg-lb" } } }
  # route-tables = { for k, v in var.network.vpcs : k => k == "tokyo" ? { "${k}-rt" = { private = {}, public = {} } } : { "${k}-rt" = { public = {} } } }
  # route-tables = {for k, v in var.network.vpcs : k => { "${k}-rt" = { public = {} } } }
}

resource "aws_route_table" "_1-rt" {
  for_each = local.route-tables.australia
  provider = aws.australia
  vpc_id   = aws_vpc._1[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.australia-nat.id : ""
    gateway_id = aws_internet_gateway._1-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.australia-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_2-rt" {
  for_each = local.route-tables.california
  provider = aws.california
  vpc_id   = aws_vpc._2[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.california-nat.id : ""
    gateway_id = aws_internet_gateway._2-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.california-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_3-rt" {
  for_each = local.route-tables.hong-kong
  provider = aws.hong-kong
  vpc_id   = aws_vpc._3[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.hong-kong-nat.id : ""
    gateway_id = aws_internet_gateway._3-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.hong-kong-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_4-rt" {
  for_each = local.route-tables.london
  provider = aws.london
  vpc_id   = aws_vpc._4[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.london-nat.id : ""
    gateway_id = aws_internet_gateway._4-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.london-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_5-rt" {
  for_each = local.route-tables.new-york
  provider = aws.new-york
  vpc_id   = aws_vpc._5[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.new-york-nat.id : ""
    gateway_id = aws_internet_gateway._5-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.new-york-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_6-rt" {
  for_each = local.route-tables.sao-paulo
  provider = aws.sao-paulo
  vpc_id   = aws_vpc._6[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.sao-paulo-nat.id : ""
    gateway_id = aws_internet_gateway._6-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.sao-paulo-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_7-rt" {
  for_each = local.route-tables.tokyo
  provider = aws.tokyo
  vpc_id   = aws_vpc._7[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.tokyo-nat.id : ""
    gateway_id = aws_internet_gateway._7-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.tokyo-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route_table" "_8-rt" {
  for_each = local.route-tables.tokyo-test
  provider = aws.tokyo-test
  vpc_id   = aws_vpc._8[each.key].id

  route {
    cidr_block = each.value.cidr
    #  use nat_gateway_id if private subnets are added
    # nat_gateway_id = each.key == "private" ? aws_nat_gateway.tokyo-test-nat.id : ""
    gateway_id = aws_internet_gateway._8-igw[each.key].id
    # gateway_id = each.key == "public" ? aws_internet_gateway.tokyo-test-igw.id : ""
  }

  tags = {
    Name = "${each.key}-rt"
  }
}

########################ROUTE TABLE ASSOCIATION ################################

resource "aws_route_table_association" "_1-rt-assoc" {
  for_each       = local.subnets.australia
  provider       = aws.australia
  subnet_id      = aws_subnet._1[each.key].id
  route_table_id = aws_route_table._1-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_2-rt-assoc" {
  for_each       = local.subnets.california
  provider       = aws.california
  subnet_id      = aws_subnet._2[each.key].id
  route_table_id = aws_route_table._2-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_3-rt-assoc" {
  for_each       = local.subnets.hong-kong
  provider       = aws.hong-kong
  subnet_id      = aws_subnet._3[each.key].id
  route_table_id = aws_route_table._3-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_4-rt-assoc" {
  for_each       = local.subnets.london
  provider       = aws.london
  subnet_id      = aws_subnet._4[each.key].id
  route_table_id = aws_route_table._4-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_5-rt-assoc" {
  for_each       = local.subnets.new-york
  provider       = aws.new-york
  subnet_id      = aws_subnet._5[each.key].id
  route_table_id = aws_route_table._5-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_6-rt-assoc" {
  for_each       = local.subnets.sao-paulo
  provider       = aws.sao-paulo
  subnet_id      = aws_subnet._6[each.key].id
  route_table_id = aws_route_table._6-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_7-rt-assoc" {
  for_each       = local.subnets.tokyo
  provider       = aws.tokyo
  subnet_id      = aws_subnet._7[each.key].id
  route_table_id = aws_route_table._7-rt[each.value.vpc].id
}

resource "aws_route_table_association" "_8-rt-assoc" {
  for_each       = local.subnets.tokyo-test
  provider       = aws.tokyo-test
  subnet_id      = aws_subnet._8[each.key].id
  route_table_id = aws_route_table._8-rt[each.value.vpc].id
}

