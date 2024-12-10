# AWS RAM
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association

locals {
  tgws = { for k,v in local.vpcs: k => {"${k}" = {name = "${k}-tgw"}} }
}

output "tgws" {
  value = local.tgws
}

resource "aws_ec2_transit_gateway" "_1" {
  for_each = local.vpcs.australia
  provider = aws.australia
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_1" {
  for_each = local.vpcs.australia
  provider = aws.australia
  subnet_ids         = [for subnet in local.subnet-identifier.australia : aws_subnet._1[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._1[each.key].id
  vpc_id             = aws_vpc._1[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_1" {
  for_each = local.vpcs.australia
  provider = aws.australia
  transit_gateway_id = aws_ec2_transit_gateway._1[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_1" {
  for_each = local.vpcs.australia
  provider = aws.australia
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._1[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._1[each.key].id
}

resource "aws_ec2_transit_gateway" "_2" {
  for_each = local.vpcs.california
  provider = aws.california
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_2" {
  for_each = local.vpcs.california
  provider = aws.california
  subnet_ids         = [for subnet in local.subnet-identifier.california : aws_subnet._2[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._2[each.key].id
  vpc_id             = aws_vpc._2[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_2" {
  for_each = local.vpcs.california
  provider = aws.california
  transit_gateway_id = aws_ec2_transit_gateway._2[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_2" {
  for_each = local.vpcs.california
  provider = aws.california
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._2[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._2[each.key].id
}

resource "aws_ec2_transit_gateway" "_3" {
  for_each = local.vpcs.hong-kong
  provider = aws.hong-kong
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_3" {
  for_each = local.vpcs.hong-kong
  provider = aws.hong-kong
  subnet_ids         = [for subnet in local.subnet-identifier.hong-kong : aws_subnet._3[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._3[each.key].id
  vpc_id             = aws_vpc._3[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_3" {
  for_each = local.vpcs.hong-kong
  provider = aws.hong-kong
  transit_gateway_id = aws_ec2_transit_gateway._3[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_3" {
  for_each = local.vpcs.hong-kong
  provider = aws.hong-kong
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._3[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._3[each.key].id
}



resource "aws_ec2_transit_gateway" "_4" {
  for_each = local.vpcs.london
  provider = aws.london
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_4" {
  for_each = local.vpcs.london
  provider = aws.london
  subnet_ids         = [for subnet in local.subnet-identifier.london : aws_subnet._4[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._4[each.key].id
  vpc_id             = aws_vpc._4[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_4" {
  for_each = local.vpcs.london
  provider = aws.london
  transit_gateway_id = aws_ec2_transit_gateway._4[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_4" {
  for_each = local.vpcs.london
  provider = aws.london
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._4[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._4[each.key].id
}

resource "aws_ec2_transit_gateway" "_5" {
  for_each = local.vpcs.new-york
  provider = aws.new-york
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_5" {
  for_each = local.vpcs.new-york
  provider = aws.new-york
  subnet_ids         = [for subnet in local.subnet-identifier.new-york : aws_subnet._5[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._5[each.key].id
  vpc_id             = aws_vpc._5[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_5" {
  for_each = local.vpcs.new-york
  provider = aws.new-york
  transit_gateway_id = aws_ec2_transit_gateway._5[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_5" {
  for_each = local.vpcs.new-york
  provider = aws.new-york
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._5[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._5[each.key].id
}

resource "aws_ec2_transit_gateway" "_6" {
  for_each = local.vpcs.sao-paulo
  provider = aws.sao-paulo
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_6" {
  for_each = local.vpcs.sao-paulo
  provider = aws.sao-paulo
  subnet_ids         = [for subnet in local.subnet-identifier.sao-paulo : aws_subnet._6[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._6[each.key].id
  vpc_id             = aws_vpc._6[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_6" {
  for_each = local.vpcs.sao-paulo
  provider = aws.sao-paulo
  transit_gateway_id = aws_ec2_transit_gateway._6[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_6" {
  for_each = local.vpcs.sao-paulo
  provider = aws.sao-paulo
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._6[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._6[each.key].id
}

resource "aws_ec2_transit_gateway" "_7" {
  for_each = local.vpcs.tokyo
  provider = aws.tokyo
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_7" {
  for_each = local.vpcs.tokyo
  provider = aws.tokyo
  subnet_ids         = [for subnet in local.subnet-identifier.tokyo : aws_subnet._7[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._7[each.key].id
  vpc_id             = aws_vpc._7[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_7" {
  for_each = local.vpcs.tokyo
  provider = aws.tokyo
  transit_gateway_id = aws_ec2_transit_gateway._7[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_7" {
  for_each = local.vpcs.tokyo
  provider = aws.tokyo
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._7[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._7[each.key].id
}

resource "aws_ec2_transit_gateway" "_8" {
  for_each = local.vpcs.tokyo-test
  provider = aws.tokyo-test
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "_8" {
  for_each = local.vpcs.tokyo-test
  provider = aws.tokyo-test
  subnet_ids         = [for subnet in local.subnet-identifier.tokyo-test : aws_subnet._8[subnet].id]
  transit_gateway_id = aws_ec2_transit_gateway._8[each.key].id
  vpc_id             = aws_vpc._8[each.key].id
}

resource "aws_ec2_transit_gateway_route_table" "_8" {
  for_each = local.vpcs.tokyo-test
  provider = aws.tokyo-test
  transit_gateway_id = aws_ec2_transit_gateway._8[each.key].id

  tags = {
    Name = "${each.key}-tgw-rt"
  }
}

resource "aws_ec2_transit_gateway_route" "_8" {
  for_each = local.vpcs.tokyo-test
  provider = aws.tokyo-test
  destination_cidr_block         = each.value.cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment._8[each.key].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table._8[each.key].id
}


# australia  _1
# california _2
# hong-kong _3
# london   _4
# new-york _5
# sao-paulo _6
# tokyo   _7
# tokyo-test _8














# resource "aws_ram_resource_association" "example" {
#   provider = aws.australia
#   resource_arn       = aws_ec2_transit_gateway.tokyo_tg.arn
#   resource_share_arn = aws_ram_resource_share.example.arn
# }



# resource "aws_ram_resource_share" "sender_share" {
#   provider = aws.tokyo

#   name                      = "tf-test-resource-share"
#   allow_external_principals = true

#   tags = {
#     Name = "tf-test-resource-share"
#   }
# }

# resource "aws_ram_principal_association" "sender_invite" {
#   provider = aws.tokyo

#   # principal          = data.aws_caller_identity.receiver.account_id
#   principal          = "471112661949"
#   resource_share_arn = aws_ram_resource_share.sender_share.arn
# }

# # data "aws_caller_identity" "receiver" {}

# resource "aws_ram_resource_share_accepter" "receiver_accept" {
#   provider = aws.australia
#   share_arn = aws_ram_principal_association.sender_invite.resource_share_arn
#   # share_arn = "arn:aws:ram:ap-southeast-2:471112661949:resource-share/cd7da845-c226-4345-9d53-8f0ca9deb5de"
# }


# resource "aws_ram_resource_association" "share_tokyo_tgw" {
#   provider = aws.australia

#   resource_arn       = aws_ec2_transit_gateway.tokyo_tg.arn
#   resource_share_arn = aws_ram_resource_share.sender_share.arn

#   depends_on = [
#     aws_ram_resource_share.sender_share,
#     aws_ram_principal_association.sender_invite,
#     aws_ec2_transit_gateway.tokyo_tg
#   ]
# }

######################################




## default route table association enable = no need to create a resource
# resource "aws_ec2_transit_gateway_route_table_association" "example" {
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo-tgw-attachment.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-route-table.id

#   depends_on = [ aws_ec2_transit_gateway_route_table.tgw-route-table,
#     aws_ec2_transit_gateway_vpc_attachment.tokyo-tgw-attachment ]
# }



# resource "aws_ec2_transit_gateway_peering_attachment" "example" {
#   peer_account_id         = aws_ec2_transit_gateway.peer.owner_id
#   peer_region             = data.aws_region.peer.name
#   peer_transit_gateway_id = aws_ec2_transit_gateway.peer.id
#   transit_gateway_id      = aws_ec2_transit_gateway.local.id

#   tags = {
#     Name = "TGW Peering Requestor"
#   }
# }

# resource "aws_ec2_transit_gateway_peering_attachment_accepter" "example" {
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.example.id

#   tags = {
#     Name = "Example cross-account attachment"
#   }
# }



# aws_vpc._1["australia"]
# aws_vpc._2["california"]
# aws_vpc._3["hong-kong"]
# aws_vpc._4["london"]
# aws_vpc._5["new-york"]
# aws_vpc._6["sao-paulo"]
# aws_vpc._7["tokyo"]
# aws_vpc._8["tokyo-test"]

# resource "aws_ec2_transit_gateway_default_route_table_association" "example" {
#   transit_gateway_id             = aws_ec2_transit_gateway.example.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
# }

# resource "aws_ec2_transit_gateway_default_route_table_propagation" "example" {
#   transit_gateway_id             = aws_ec2_transit_gateway.example.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
# }



# provider "aws" {
#   alias  = "local"
#   region = "us-east-1"
# }

# provider "aws" {
#   alias  = "peer"
#   region = "us-west-2"
# }

# data "aws_region" "peer" {
#   provider = aws.peer
# }

# resource "aws_ec2_transit_gateway" "local" {
#   provider = aws.local

#   tags = {
#     Name = "Local TGW"
#   }
# }

# resource "aws_ec2_transit_gateway" "peer" {
#   provider = aws.peer

#   tags = {
#     Name = "Peer TGW"
#   }
# }




# resource "aws_ec2_transit_gateway_route_table_propagation" "example" {
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.example.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "example" {
#   subnet_ids         = [aws_subnet.example.id]
#   transit_gateway_id = aws_ec2_transit_gateway.example.id
#   vpc_id             = aws_vpc.example.id
# }

# resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "example" {
#   transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.example.id

#   tags = {
#     Name = "Example cross-account attachment"
#   }
# }


#################################################################


# resource "aws_networkmanager_global_network" "global-network" {
#   description = "Transit Gateway"
# }

# resource "aws_networkmanager_transit_gateway_registration" "global-network-tg-registration" {
#   global_network_id   = aws_networkmanager_global_network.global-network.id
#   transit_gateway_arn = aws_ec2_transit_gateway.transit-gateway.arn
# }

# Work on creating the connections between the Transit Gateway and the VPCs
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkmanager_vpc_attachment



# Possible Solution

# resource "aws_ec2_transit_gateway" "tgw" {
#   provider = aws.virginia

#   description = "Transit Gateway connecting Tokyo and Virginia"

#   tags = {
#     Name = "Main Transit Gateway"
#   }
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_tgw_attachment" {
#   provider            = aws.tokyo
#   transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
#   vpc_id              = aws_vpc.tokyo_vpc.id
#   subnet_ids          = [aws_subnet.tokyo_subnet_1.id, aws_subnet.tokyo_subnet_2.id]

#   tags = {
#     Name = "Tokyo TGW Attachment"
#   }
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "virginia_tgw_attachment" {
#   provider            = aws.virginia
#   transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
#   vpc_id              = aws_vpc.virginia_vpc.id
#   subnet_ids          = [aws_subnet.virginia_subnet_1.id, aws_subnet.virginia_subnet_2.id]

#   tags = {
#     Name = "Virginia TGW Attachment"
#   }
# }

# resource "aws_route" "tokyo_to_virginia" {
#   provider            = aws.tokyo
#   route_table_id      = aws_route_table.tokyo_route_table.id
#   destination_cidr_block = aws_vpc.virginia_vpc.cidr_block
#   transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
# }

# resource "aws_route" "virginia_to_tokyo" {
#   provider            = aws.virginia
#   route_table_id      = aws_route_table.virginia_route_table.id
#   destination_cidr_block = aws_vpc.tokyo_vpc.cidr_block
#   transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
# }






# resource "aws_networkmanager_core_network" "example" {
#   global_network_id = aws_networkmanager_global_network.example.id

#   tags = {
#     "hello" = "world"
#   }
# }

# resource "aws_networkmanager_transit_gateway_peering" "example" {
#   core_network_id     = awscc_networkmanager_core_network.example.id
#   transit_gateway_arn = aws_ec2_transit_gateway.example.arn
# }

# resource "aws_networkmanager_vpc_attachment" "example" {
#   subnet_arns     = aws_subnet.example[*].arn
#   core_network_id = awscc_networkmanager_core_network.example.id
#   vpc_arn         = aws_vpc.example.arn
# }

# resource "aws_networkmanager_connect_attachment" "example" {
#   core_network_id         = awscc_networkmanager_core_network.example.id
#   transport_attachment_id = aws_networkmanager_vpc_attachment.example.id
#   edge_location           = aws_networkmanager_vpc_attachment.example.edge_location
#   options {
#     protocol = "GRE"
#   }
# }

# resource "aws_networkmanager_connect_peer" "example" {
#   connect_attachment_id = aws_networkmanager_connect_attachment.example.id
#   peer_address          = "127.0.0.1"
#   bgp_options {
#     peer_asn = 65000
#   }
#   inside_cidr_blocks = ["172.16.0.0/16"]
# }

# resource "aws_networkmanager_transit_gateway_route_table_attachment" "example" {
#   peering_id                      = aws_networkmanager_transit_gateway_peering.example.id
#   transit_gateway_route_table_arn = aws_ec2_transit_gateway_route_table.example.arn
# }

# resource "aws_networkmanager_vpc_attachment" "example" {
#   subnet_arns     = [aws_subnet.example.arn]
#   core_network_id = awscc_networkmanager_core_network.example.id
#   vpc_arn         = aws_vpc.example.arn
# }

# resource "aws_networkmanager_transit_gateway_route_table_attachment" "example" {
#   peering_id                      = aws_networkmanager_transit_gateway_peering.example.id
#   transit_gateway_route_table_arn = aws_ec2_transit_gateway_route_table.example.arn
# }
