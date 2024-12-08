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

# australia  _1
# california _2
# hong-kong _3
# london   _4
# new-york _5
# sao-paulo _6
# tokyo   _7
# tokyo-test _8
