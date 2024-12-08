resource "aws_eip" "_1-eip" {
  for_each = local.subnets.australia
  provider = aws.australia
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_1-nat" {
  for_each = local.subnets.australia
  provider = aws.australia
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._1-eip[each.key].id
  subnet_id     = aws_subnet._1[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_2-eip" {
  for_each = local.subnets.california
  provider = aws.california
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_2-nat" {
  for_each = local.subnets.california
  provider = aws.california
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._2-eip[each.key].id
  subnet_id     = aws_subnet._2[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_3-eip" {
  for_each = local.subnets.hong-kong
  provider = aws.hong-kong
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_3-nat" {
  for_each      = local.subnets.hong-kong
  provider      = aws.hong-kong
  allocation_id = aws_eip._3-eip[each.key].id
  subnet_id     = aws_subnet._3[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_4-eip" {
  for_each = local.subnets.london
  provider = aws.london
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_4-nat" {
  for_each = local.subnets.london
  provider = aws.london
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._4-eip[each.key].id
  subnet_id     = aws_subnet._4[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_5-eip" {
  for_each = local.subnets.new-york
  provider = aws.new-york
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_5-nat" {
  for_each = local.subnets.new-york
  provider = aws.new-york
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._5-eip[each.key].id
  subnet_id     = aws_subnet._5[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_6-eip" {
  for_each = local.subnets.sao-paulo
  provider = aws.sao-paulo
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_6-nat" {
  for_each = local.subnets.sao-paulo
  provider = aws.sao-paulo
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._6-eip[each.key].id
  subnet_id     = aws_subnet._6[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_7-eip" {
  # for_each = local.subnets.tokyo 
  for_each = { for k, v in local.subnets.tokyo : k => v if endswith(k, "public") }
  provider = aws.tokyo
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_7-nat" {
  # for_each = local.subnets.tokyo
  for_each = { for k, v in local.subnets.tokyo : k => v if endswith(k, "public") }
  provider = aws.tokyo
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._7-eip[each.key].id
  subnet_id     = aws_subnet._7[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}

resource "aws_eip" "_8-eip" {
  for_each = local.subnets.tokyo-test
  provider = aws.tokyo-test
  domain   = "vpc"
  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_nat_gateway" "_8-nat" {
  for_each = local.subnets.tokyo-test
  provider = aws.tokyo-test
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._8-eip[each.key].id
  subnet_id     = aws_subnet._8[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
}



