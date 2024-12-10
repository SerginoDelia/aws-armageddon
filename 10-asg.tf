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

resource "aws_autoscaling_group" "_3" {
  for_each = local.asg-subnets.hong-kong
  provider = aws.hong-kong
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.hong-kong : aws_subnet._3[subnet].id]

  launch_template {
    id      = aws_launch_template._3["hong-kong-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "4" {
  for_each = local.asg-subnets.london
  provider = aws.london
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.london : aws_subnet.4[subnet].id]

  launch_template {
    id      = aws_launch_template.4["london-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "_5" {
  for_each = local.asg-subnets.new-york
  provider = aws.new-york
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.new-york : aws_subnet._5[subnet].id]

  launch_template {
    id      = aws_launch_template._5["new-york-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "_6" {
  for_each = local.asg-subnets.sao-paulo
  provider = aws.sao-paulo
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.sao-paulo : aws_subnet._6[subnet].id]

  launch_template {
    id      = aws_launch_template._6["sao-paulo-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "_7" {
  for_each = local.asg-subnets.tokyo
  provider = aws.tokyo
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.tokyo : aws_subnet._7[subnet].id]

  launch_template {
    id      = aws_launch_template._7["tokyo-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "_8" {
  for_each = local.asg-subnets.toke-test
  provider = aws.toke-test
  name     = each.key
  # availability_zones   = []
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier = [for subnet in local.subnet-identifier.toke-test : aws_subnet._8[subnet].id]

  launch_template {
    id      = aws_launch_template._8["toke-test-lt"].id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = each.key
    propagate_at_launch = true
  }
}
