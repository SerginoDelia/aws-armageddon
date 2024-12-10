locals {
  load-balancers = { for k, v in local.subnets : k => { "${k}-lb" = { sg = "${k}-sg-lb" } } }
}


resource "aws_lb" "_1" {
  for_each           = local.load-balancers.australia
  provider = aws.australia
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._1[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.australia : aws_subnet._1[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_2" {
  for_each           = local.load-balancers.california
  provider = aws.california
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._2[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.california : aws_subnet._2[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_3" {
  for_each           = local.load-balancers.hong-kong
  provider = aws.hong-kong
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._3[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.hong-kong : aws_subnet._3[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_4" {
  for_each           = local.load-balancers.london
  provider = aws.london
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._4[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.london : aws_subnet._4[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_5" {
  for_each           = local.load-balancers.new-york
  provider = aws.new-york
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._5[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.new-york : aws_subnet._5[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_6" {
  for_each           = local.load-balancers.sao-paulo
  provider = aws.sao-paulo
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._6[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.sao-paulo : aws_subnet._6[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_7" {
  for_each           = local.load-balancers.tokyo
  provider = aws.tokyo
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._7[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.tokyo : aws_subnet._7[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

resource "aws_lb" "_8" {
  for_each           = local.load-balancers.tokyo-test
  provider = aws.tokyo-test
  name               = each.key
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._8[each.value.sg].id]
  subnets            = [for subnet in local.subnet-identifier.tokyo-test : aws_subnet._8[subnet].id]
  enable_deletion_protection = false

  tags = {
    Name    = each.key
  }
}

# australia  _1
# california _2
# hong-kong _3
# london   _4
# new-york _5
# sao-paulo _6
# tokyo   _7
# tokyo-test _8