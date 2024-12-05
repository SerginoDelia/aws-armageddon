resource "aws_internet_gateway" "_1-igw" {
  for_each = local.vpcs.australia
  # vpc_id   = aws_vpc.australia-vpc.id
  vpc_id   = aws_vpc._1[each.key].id
  provider = aws.australia
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_2-igw" {
  for_each = local.vpcs.california
  vpc_id   = aws_vpc._2[each.key].id
  provider = aws.california
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_3-igw" {
  for_each = local.vpcs.hong-kong
  vpc_id   = aws_vpc._3[each.key].id
  provider = aws.hong-kong
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_4-igw" {
  for_each = local.vpcs.london
  vpc_id   = aws_vpc._4[each.key].id
  provider = aws.london
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_5-igw" {
  for_each = local.vpcs.new-york
  vpc_id   = aws_vpc._5[each.key].id
  provider = aws.new-york
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_6-igw" {
  for_each = local.vpcs.sao-paulo
  vpc_id   = aws_vpc._6[each.key].id
  provider = aws.sao-paulo
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_7-igw" {
  for_each = local.vpcs.tokyo
  vpc_id   = aws_vpc._7[each.key].id
  provider = aws.tokyo
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

resource "aws_internet_gateway" "_8-igw" {
  for_each = local.vpcs.tokyo-test
  vpc_id   = aws_vpc._8[each.key].id
  provider = aws.tokyo-test
  tags = {
    Name = "_1-igw-${each.key}"
  }
}

# aws_subnet._1["australia-a-public"]
# aws_vpc._1["australia"]


# # aws_vpc.australia-vpc
# # aws_vpc.california-vpc
# # aws_vpc.hong-kong-vpc
# # aws_vpc.london-vpc
# # aws_vpc.new-york-vpc
# # aws_vpc.sao-paulo-vpc
# # aws_vpc.tokyo-vpc
