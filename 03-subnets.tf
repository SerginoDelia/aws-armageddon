locals {
  subnets = var.network.subnets
}
# aws_vpc._1["australia"]
# aws_vpc._2["california"]
# aws_vpc._3["hong-kong"]
# aws_vpc._4["london"]
# aws_vpc._5["new-york"]
# aws_vpc._6["sao-paulo"]
# aws_vpc._7["tokyo"]
# aws_vpc._8["tokyo-test"]
resource "aws_subnet" "_1" {
  for_each          = local.subnets.australia
  provider          = aws.australia
  vpc_id            = aws_vpc._1[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_2" {
  for_each          = local.subnets.california
  provider          = aws.california
  vpc_id            = aws_vpc._2[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_3" {
  for_each          = local.subnets.hong-kong
  provider          = aws.hong-kong
  vpc_id            = aws_vpc._3[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_4" {
  for_each          = local.subnets.london
  provider          = aws.london
  vpc_id            = aws_vpc._4[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_5" {
  for_each          = local.subnets.new-york
  provider          = aws.new-york
  vpc_id            = aws_vpc._5[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_6" {
  for_each          = local.subnets.sao-paulo
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc._6[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_7" {
  for_each          = local.subnets.tokyo
  provider          = aws.tokyo
  vpc_id            = aws_vpc._7[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_8" {
  for_each          = local.subnets.tokyo-test
  provider          = aws.tokyo-test
  vpc_id            = aws_vpc._8[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}


# # resource "aws_subnet" "_1" {
# #   for_each          = var.australia-subnets
# #   provider          = aws.australia
# #   vpc_id            = aws_vpc.australia-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }
# # resource "aws_subnet" "_2" {
# #   for_each          = var.california-subnets
# #   provider          = aws.california
# #   vpc_id            = aws_vpc.california-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# # resource "aws_subnet" "_3" {
# #   for_each          = var.hong-kong-subnets
# #   provider          = aws.hong-kong
# #   vpc_id            = aws_vpc.hong-kong-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# # resource "aws_subnet" "_4" {
# #   for_each          = var.london-subnets
# #   provider          = aws.london
# #   vpc_id            = aws_vpc.london-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# # resource "aws_subnet" "_5" {
# #   for_each          = var.new-york-subnets
# #   provider          = aws.new-york
# #   vpc_id            = aws_vpc.new-york-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# # resource "aws_subnet" "_6" {
# #   for_each          = var.sao-paulo-subnets
# #   provider          = aws.sao-paulo
# #   vpc_id            = aws_vpc.sao-paulo-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# # resource "aws_subnet" "_7" {
# #   for_each          = var.tokyo-subnets
# #   provider          = aws.tokyo
# #   vpc_id            = aws_vpc.tokyo-vpc.id
# #   cidr_block        = each.value.cidr
# #   availability_zone = each.value.az

# #   tags = {
# #     Name = each.key
# #   }
# # }

# resource "aws_subnet" "tokyo" {
#   for_each          = var.tokyo-subnets
#   provider          = aws.tokyo
#   vpc_id            = aws_vpc.tokyo-vpc.id
#   cidr_block        = each.value.cidr
#   availability_zone = each.value.az

#   tags = {
#     Name = each.key
#   }
# }
