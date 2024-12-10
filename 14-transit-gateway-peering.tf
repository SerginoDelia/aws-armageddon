locals {
  tgw-peering = { 
    australia = {}
    california = {}
    hong-kong = {}
    london = {}
    new-york = {}
    sao-paulo = {}
  }
}


data "aws_caller_identity" "australia" {
  provider = aws.australia
}

data "aws_caller_identity" "california" {
  provider = aws.california
}

data "aws_caller_identity" "hong-kong" {
  provider = aws.hong-kong
}

data "aws_caller_identity" "london" {
  provider = aws.london
}

data "aws_caller_identity" "new-york" {
  provider = aws.new-york
}

data "aws_caller_identity" "sao-paulo" {
  provider = aws.sao-paulo
}

# Create the Peering attachment in the second account...
resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-australia" {
  provider = aws.tokyo

  peer_account_id         = data.aws_caller_identity.australia.account_id
  peer_region             = var.setup.australia
  peer_transit_gateway_id = aws_ec2_transit_gateway._1["australia"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-california" {
  provider = aws.tokyo

  peer_region             = var.setup.california
  peer_transit_gateway_id = aws_ec2_transit_gateway._2["california"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-hong-kong" {
  provider = aws.tokyo

  peer_region             = var.setup.hong-kong
  peer_transit_gateway_id = aws_ec2_transit_gateway._3["hong-kong"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-london" {
  provider = aws.tokyo

  peer_region             = var.setup.london
  peer_transit_gateway_id = aws_ec2_transit_gateway._4["london"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-new-york" {
  provider = aws.tokyo

  peer_region             = var.setup.new-york
  peer_transit_gateway_id = aws_ec2_transit_gateway._5["new-york"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-sao-paulo" {
  provider = aws.tokyo

  peer_region             = var.setup.sao-paulo
  peer_transit_gateway_id = aws_ec2_transit_gateway._6["sao-paulo"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "terraform-example"
    Side = "Creator"
  }
}

# data "aws_ec2_transit_gateway_peering_attachment" "australia" {
#   provider = aws.australia
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._1["australia"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }

# data "aws_ec2_transit_gateway_peering_attachment" "california" {
#   provider = aws.california
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._2["california"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }

# data "aws_ec2_transit_gateway_peering_attachment" "hong-kong" {
#   provider = aws.hong-kong
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._3["hong-kong"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }

# data "aws_ec2_transit_gateway_peering_attachment" "london" {
#   provider = aws.london
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._4["london"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }

# data "aws_ec2_transit_gateway_peering_attachment" "new-york" {
#   provider = aws.new-york
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._5["new-york"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }

# data "aws_ec2_transit_gateway_peering_attachment" "sao-paulo" {
#   provider = aws.sao-paulo
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._6["sao-paulo"].id]
#   }
#   # depends_on = [aws_ec2_transit_gateway_peering_attachment.example]
# }


resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_1-australia" {
  provider = aws.australia

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-australia.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_2-california" {
  provider = aws.california

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-california.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_3-hong-kong" {
  provider = aws.hong-kong

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-hong-kong.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_4-london" {
  provider = aws.london

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-london.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_5-new-york" {
  provider = aws.new-york

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-new-york.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_6-sao-paulo" {
  provider = aws.sao-paulo

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-sao-paulo.id
  tags = {
    Name = "terraform-example"
    Side = "Acceptor"
  }
}



# tokyo-australia
# tokyo-california
# tokyo-hong-kong
# tokyo-london
# tokyo-new-york
# tokyo-sao-paulo



# data "aws_ec2_transit_gateway_peering_attachment" "_1" {
#   for_each = aws_autoscaling_group._1
#   provider = aws.australia
#   filter {
#     name   = "transit-gateway-id"
#     values = [aws_ec2_transit_gateway._1[each.key].id]
#   }

#   depends_on = [aws_ec2_transit_gateway_peering_attachment._7-tokyo-to]
# }

# # ...and accept it in the first account.
# resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_1" {
#   for_each = local.vpcs.australia
#   provider = aws.australia

#   transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment._7-tokyo-to[each.key].id
#   tags = {
#     Name = "terraform-example"
#     Side = "Acceptor"
#   }
# }




# aws_ec2_transit_gateway._1["australia"]
# aws_ec2_transit_gateway._2["california"]
# aws_ec2_transit_gateway._3["hong-kong"]
# aws_ec2_transit_gateway._4["london"]
# aws_ec2_transit_gateway._5["new-york"]
# aws_ec2_transit_gateway._6["sao-paulo"]
# aws_ec2_transit_gateway._7["tokyo"]
# aws_ec2_transit_gateway._8["tokyo-test"]
# aws_ec2_transit_gateway_route._1["australia"]
# aws_ec2_transit_gateway_route._2["california"]
# aws_ec2_transit_gateway_route._3["hong-kong"]
# aws_ec2_transit_gateway_route._4["london"]
# aws_ec2_transit_gateway_route._5["new-york"]
# aws_ec2_transit_gateway_route._6["sao-paulo"]
# aws_ec2_transit_gateway_route._7["tokyo"]
# aws_ec2_transit_gateway_route._8["tokyo-test"]
# aws_ec2_transit_gateway_route_table._1["australia"]
# aws_ec2_transit_gateway_route_table._2["california"]
# aws_ec2_transit_gateway_route_table._3["hong-kong"]
# aws_ec2_transit_gateway_route_table._4["london"]
# aws_ec2_transit_gateway_route_table._5["new-york"]
# aws_ec2_transit_gateway_route_table._6["sao-paulo"]
# aws_ec2_transit_gateway_route_table._7["tokyo"]
# aws_ec2_transit_gateway_route_table._8["tokyo-test"]
# aws_ec2_transit_gateway_vpc_attachment._1["australia"]
# aws_ec2_transit_gateway_vpc_attachment._2["california"]
# aws_ec2_transit_gateway_vpc_attachment._3["hong-kong"]
# aws_ec2_transit_gateway_vpc_attachment._4["london"]
# aws_ec2_transit_gateway_vpc_attachment._5["new-york"]
# aws_ec2_transit_gateway_vpc_attachment._6["sao-paulo"]
# aws_ec2_transit_gateway_vpc_attachment._7["tokyo"]
# aws_ec2_transit_gateway_vpc_attachment._8["tokyo-test"]