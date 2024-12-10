locals {
  target-groups = { for k, v in local.subnets : k => { "${k}-tg" = { vpc = "${k}" } } }
  tg-values = {
    port     = 80
    protocol = "HTTP"
  }
}

# output "target-groups" {
#   value = local.target-groups
# }

resource "aws_lb_target_group" "_1" {
  for_each = local.target-groups.australia
  provider = aws.australia
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._1[each.value.vpc].id
}

resource "aws_lb_target_group" "_2" {
  for_each = local.target-groups.california
  provider = aws.california
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._2[each.value.vpc].id
}

resource "aws_lb_target_group" "_3" {
  for_each = local.target-groups.hong-kong
  provider = aws.hong-kong
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._3[each.value.vpc].id
}

resource "aws_lb_target_group" "_4" {
  for_each = local.target-groups.london
  provider = aws.london
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._4[each.value.vpc].id
}

resource "aws_lb_target_group" "_5" {
  for_each = local.target-groups.new-york
  provider = aws.new-york
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._5[each.value.vpc].id
}

resource "aws_lb_target_group" "_6" {
  for_each = local.target-groups.sao-paulo
  provider = aws.sao-paulo
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._6[each.value.vpc].id
}

resource "aws_lb_target_group" "_7" {
  for_each = local.target-groups.tokyo
  provider = aws.tokyo
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._7[each.value.vpc].id
}

resource "aws_lb_target_group" "_tokyo-test" {
  for_each = local.target-groups.hong-kong
  provider = aws.hong-kong
  name     = each.key
  port     = local.tg-values.port
  protocol = local.tg-values.protocol
  vpc_id   = aws_vpc._tokyo-test[each.value.vpc].id
}