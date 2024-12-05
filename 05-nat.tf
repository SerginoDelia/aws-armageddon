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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  for_each = local.subnets.hong-kong
  provider = aws.hong-kong
  # allocation_id = aws_eip.tokyo-nat.id
  allocation_id = aws_eip._3-eip[each.key].id
  subnet_id     = aws_subnet._3[each.key].id

  tags = {
    Name = "${each.key}-nat"
  }
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
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
  # aws_internet_gateway.tokyo-igw
  # depends_on = [aws_internet_gateway.tokyo-igw]
}


# aws_subnet._1["australia-a-public"]
# aws_subnet._1["australia-b-public"]
# aws_subnet._2["california-a-public"]
# aws_subnet._2["california-b-public"]
# aws_subnet._3["hong-kong-a-public"]
# aws_subnet._3["hong-kong-b-public"]
# aws_subnet._4["london-a-public"]
# aws_subnet._4["london-b-public"]
# aws_subnet._5["new-york-a-public"]
# aws_subnet._5["new-york-b-public"]
# aws_subnet._6["sao-paulo-a-public"]
# aws_subnet._6["sao-paulo-c-public"]
# aws_subnet._7["tokyo-a-public"]
# aws_subnet._7["tokyo-d-public"]
# aws_subnet._8["tokyotest-c-public"]
# aws_vpc._1["australia"]
# aws_vpc._2["california"]
# aws_vpc._3["hong-kong"]
# aws_vpc._4["london"]
# aws_vpc._5["new-york"]
# aws_vpc._6["sao-paulo"]
# aws_vpc._7["tokyo"]
# aws_vpc._8["tokyo-test"]

# aws_subnet._1["australia-a-public"]
# aws_vpc._1["australia"]



# resource "aws_nat_gateway" "tokyo-nat" {
#   provider      = aws.tokyo
#   allocation_id = aws_eip.tokyo-nat.id
#   subnet_id     = aws_subnet._7["tokyo-a-private"].id

#   tags = {
#     Name = "${var.vpcs.tokyo.name}-nat"
#   }
#   # aws_internet_gateway.tokyo-igw
#   depends_on = [aws_internet_gateway.tokyo-igw]
# }




# # resource "aws_eip" "_1nat" {
# #   for_each = var.australia-subnets
# #   provider = aws.australia
# #   domain   = "vpc"

# #   tags = {
# #     Name = each.value.vpc
# #   }
# # }

# # resource "aws_nat_gateway" "_1nat" {
# #   for_each      = var.australia-subnets
# #   provider      = aws.australia
# #   allocation_id = aws_eip._1nat[each.key].id
# #   subnet_id     = aws_subnet._1[each.key].id

# #   tags = {
# #     Name = each.key
# #   }
# #   # aws_internet_gateway.australia-igw
# #   depends_on = [aws_internet_gateway.australia-igw]
# # }

# # resource "aws_eip" "_7nat" {
# #   for_each = var.tokyo-subnets
# #   provider = aws.tokyo
# #   domain   = "vpc"

# #   tags = {
# #     Name = each.value.vpc
# #   }
# # }

# # resource "aws_nat_gateway" "_7nat" {
# #   for_each      = var.tokyo-subnets
# #   provider      = aws.tokyo
# #   allocation_id = aws_eip._7nat[each.key].id
# #   subnet_id     = aws_subnet._7[each.key].id

# #   tags = {
# #     Name = each.key
# #   }
# #   # aws_internet_gateway.tokyo-igw
# #   depends_on = [aws_internet_gateway.tokyo-igw]
# # }



# # aws_vpc.australia-vpc
# # aws_vpc.california-vpc
# # aws_vpc.hong-kong-vpc
# # aws_vpc.london-vpc
# # aws_vpc.new-york-vpc
# # aws_vpc.sao-paulo-vpc
# # aws_vpc.tokyo-vpc

# # aws_subnet._1["tokyo-a-private"]
# # aws_subnet._1["tokyo-a-public"]
# # aws_subnet._1["tokyo-d-private"]
# # aws_subnet._1["tokyo-d-public"]
# # aws_subnet._1["tokyotest-c-public"]

# # aws_subnet._2["london-a-public"]
# # aws_subnet._2["london-b-public"]

# # aws_subnet._3["sao-paulo-a-public"]
# # aws_subnet._3["sao-paulo-c-public"]

# # aws_subnet._4["australia-a-public"]
# # aws_subnet._4["australia-b-public"]

# # aws_subnet._5["hong-kong-a-public"]
# # aws_subnet._5["hong-kong-b-public"]

# # aws_subnet._6["california-a-public"]
# # aws_subnet._6["california-b-public"]

# # aws_subnet._7["new-york-a-public"]
# # aws_subnet._7["new-york-b-public"]


# # resource "aws_subnet" "_1" {
# #   for_each          = var.tokyo-subnets
# #   provider          = aws.tokyo
# #   vpc_id            = aws_vpc.tokyo-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }


