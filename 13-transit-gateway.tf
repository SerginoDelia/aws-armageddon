

resource "aws_networkmanager_global_network" "global-network" {
  description = "Transit Gateway"
}

resource "aws_ec2_transit_gateway" "transit-gateway" {

  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"

  default_route_table_propagation = "enable"
  transit_gateway_cidr_blocks     = ["10.0.0.0/8"]
}



resource "aws_networkmanager_transit_gateway_registration" "global-network-tg-registration" {
  global_network_id   = aws_networkmanager_global_network.global-network.id
  transit_gateway_arn = aws_ec2_transit_gateway.transit-gateway.arn
}

# Work on creating the connections between the Transit Gateway and the VPCs
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkmanager_vpc_attachment

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
