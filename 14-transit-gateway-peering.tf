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
    Name = "tokyo-to-australia"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-california" {
  provider = aws.tokyo

  peer_region             = var.setup.california
  peer_transit_gateway_id = aws_ec2_transit_gateway._2["california"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "tokyo-to-california"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-hong-kong" {
  provider = aws.tokyo

  peer_region             = var.setup.hong-kong
  peer_transit_gateway_id = aws_ec2_transit_gateway._3["hong-kong"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "tokyo-to-hong-kong"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-london" {
  provider = aws.tokyo

  peer_region             = var.setup.london
  peer_transit_gateway_id = aws_ec2_transit_gateway._4["london"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "tokyo-to-london"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-new-york" {
  provider = aws.tokyo

  peer_region             = var.setup.new-york
  peer_transit_gateway_id = aws_ec2_transit_gateway._5["new-york"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "tokyo-to-new-york"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "_7-tokyo-to-sao-paulo" {
  provider = aws.tokyo

  peer_region             = var.setup.sao-paulo
  peer_transit_gateway_id = aws_ec2_transit_gateway._6["sao-paulo"].id
  transit_gateway_id      = aws_ec2_transit_gateway._7["tokyo"].id
  tags = {
    Name = "tokyo-to-sao-paulo"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_1-australia" {
  provider = aws.australia

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-australia.id
  tags = {
    Name = "australia-peering-acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_2-california" {
  provider = aws.california

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-california.id
  tags = {
    Name = "california-peering-acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_3-hong-kong" {
  provider = aws.hong-kong

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-hong-kong.id
  tags = {
    Name = "hong-kong-peering-acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_4-london" {
  provider = aws.london

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-london.id
  tags = {
    Name = "london-peering-acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_5-new-york" {
  provider = aws.new-york

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-new-york.id
  tags = {
    Name ="new-york-peering-acceptor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "_6-sao-paulo" {
  provider = aws.sao-paulo

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment._7-tokyo-to-sao-paulo.id
  tags = {
    Name = "sao-paulo-peering-acceptor"
  }
}



# tokyo-australia
# tokyo-california
# tokyo-hong-kong
# tokyo-london
# tokyo-new-york
# tokyo-sao-paulo
