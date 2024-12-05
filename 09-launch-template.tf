locals {
  lt-names = { for k, v in var.network.vpcs : k => { "${k}-lt" = { vpc = "${k}", key-pair = "${k}-key-pair",
    user-data = base64encode(file("user-data.sh")), resource_type = "instance",
  instance_type = "t2.micro", sg = "${k}-sg-server" } } }
}

resource "aws_launch_template" "_1" {
  for_each      = local.lt-names.australia
  provider      = aws.australia
  name          = each.key
  image_id      = data.aws_ami.australia-ami.id
  instance_type = each.value.instance_type
  key_name      = each.value.key-pair
  # vpc_security_group_ids = [aws_security_group._1["australia-sg-server"].id]
  vpc_security_group_ids = [aws_security_group._1[each.value.sg].id]
  # user_data              = base64encode(file("user-data.sh"))
  user_data = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_2" {
  for_each               = local.lt-names.california
  provider               = aws.california
  name                   = each.key
  image_id               = data.aws_ami.california-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._2[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_3" {
  for_each               = local.lt-names.hong-kong
  provider               = aws.hong-kong
  name                   = each.key
  image_id               = data.aws_ami.hong-kong-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._3[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_4" {
  for_each               = local.lt-names.london
  provider               = aws.london
  name                   = each.key
  image_id               = data.aws_ami.london-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._4[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_5" {
  for_each               = local.lt-names.new-york
  provider               = aws.new-york
  name                   = each.key
  image_id               = data.aws_ami.new-york-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._5[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_6" {
  for_each               = local.lt-names.sao-paulo
  provider               = aws.sao-paulo
  name                   = each.key
  image_id               = data.aws_ami.sao-paulo-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._6[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_7" {
  for_each               = local.lt-names.tokyo
  provider               = aws.tokyo
  name                   = each.key
  image_id               = data.aws_ami.tokyo-ami.id
  instance_type          = each.value.instance_type
  key_name               = each.value.key-pair
  vpc_security_group_ids = [aws_security_group._7[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "_8" {
  for_each               = local.lt-names.tokyo-test
  provider               = aws.tokyo-test
  name                   = each.key
  image_id               = data.aws_ami.tokyo-ami.id
  instance_type          = each.value.instance_type
  key_name               = "tokyo-key-pair"
  vpc_security_group_ids = [aws_security_group._8[each.value.sg].id]
  user_data              = each.value.user-data
  tag_specifications {
    resource_type = each.value.resource_type
    tags = {
      Name = each.key
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}


# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc
# aws_vpc.tokyo-test-vpc
