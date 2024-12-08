locals {
  asg-subnets = { for k, v in local.subnets : k => { "${k}-asg" = toset(keys(v)) } }
  # asg-subnets       = { for k, v in local.subnets : "${k}-asg" => { "lt" = "${k}-lt" } }
  subnet-identifier = { for k, v in local.subnets : k => keys(v) }
}

resource "aws_autoscaling_group" "_1" {
  for_each = local.asg-subnets.australia
  provider = aws.australia
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  # aws_subnet._1["australia-a-public"]
  # vpc_zone_identifier  = [each.value]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.australia : aws_subnet._1[subnet].id]

  launch_template {
    id      = aws_launch_template._1["australia-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "_2" {
  for_each = local.asg-subnets.california
  provider = aws.california
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  # aws_subnet._2["california-a-public"]
  # vpc_zone_identifier  = [each.value]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.california : aws_subnet._2[subnet].id]

  launch_template {
    id      = aws_launch_template._2["california-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
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
