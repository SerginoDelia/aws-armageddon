locals {
  vpcs = var.network.vpcs
}

resource "aws_vpc" "_1" {
  for_each   = local.vpcs.australia
  cidr_block = each.value.cidr
  provider   = aws.australia
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_2" {
  for_each   = local.vpcs.california
  cidr_block = each.value.cidr
  provider   = aws.california
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_3" {
  for_each   = local.vpcs.hong-kong
  cidr_block = each.value.cidr
  provider   = aws.hong-kong
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_4" {
  for_each   = local.vpcs.london
  cidr_block = each.value.cidr
  provider   = aws.london
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_5" {
  for_each   = local.vpcs.new-york
  cidr_block = each.value.cidr
  provider   = aws.new-york
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_6" {
  for_each   = local.vpcs.sao-paulo
  cidr_block = each.value.cidr
  provider   = aws.sao-paulo
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_7" {
  for_each   = local.vpcs.tokyo
  cidr_block = each.value.cidr
  provider   = aws.tokyo
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

resource "aws_vpc" "_8" {
  for_each   = local.vpcs.tokyo-test
  cidr_block = each.value.cidr
  provider   = aws.tokyo
  tags = {
    Name = "${each.value.name}-vpc"
  }
}

# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc

# aws_vpc._1["tokyo"]

# resource "aws_vpc" "tokyo-vpc" {
#   cidr_block = var.vpcs.tokyo.cidr
#   provider   = aws.tokyo
#   tags = {
#     Name = var.vpcs.tokyo.name
#   }
# }

# resource "aws_vpc" "new-york-vpc" {
#   cidr_block = var.vpcs.new-york.cidr
#   provider   = aws.new-york
#   tags = {
#     Name = var.vpcs.new-york.name
#   }
# }

# resource "aws_vpc" "london-vpc" {

#   cidr_block = var.vpcs.london.cidr
#   provider   = aws.london
#   tags = {
#     Name = var.vpcs.london.name
#   }
# }

# resource "aws_vpc" "sao-paulo-vpc" {

#   cidr_block = var.vpcs.sao-paulo.cidr
#   provider   = aws.sao-paulo
#   tags = {
#     Name = var.vpcs.sao-paulo.name
#   }
# }

# resource "aws_vpc" "australia-vpc" {

#   cidr_block = var.vpcs.australia.cidr
#   provider   = aws.australia
#   tags = {
#     Name = var.vpcs.australia.name
#   }
# }

# resource "aws_vpc" "hong-kong-vpc" {

#   cidr_block = var.vpcs.hong-kong.cidr
#   provider   = aws.hong-kong
#   tags = {
#     Name = var.vpcs.hong-kong.name
#   }
# }

# resource "aws_vpc" "california-vpc" {

#   cidr_block = var.vpcs.california.cidr
#   provider   = aws.california
#   tags = {
#     Name = var.vpcs.california.name
#   }
# }


