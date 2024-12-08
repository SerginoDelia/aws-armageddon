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