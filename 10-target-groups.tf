locals {
  target-groups = { for k, v in var.vpcs : k => { "${k}-tg" = { port = 80, protocol = "HTTP" } } }
}

# resource "aws_lb_target_group" "_1" {
#   for_each = local.target-groups.australia
#   provider = aws.australia
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.australia-vpc.id
# }

# resource "aws_lb_target_group" "_2" {
#   for_each = local.target-groups.california
#   provider = aws.california
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.california-vpc.id
# }

# resource "aws_lb_target_group" "_3" {
#   for_each = local.target-groups.hong-kong
#   provider = aws.hong-kong
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.hong-kong-vpc.id
# }

# resource "aws_lb_target_group" "_4" {
#   for_each = local.target-groups.london
#   provider = aws.london
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.london-vpc.id
# }

# resource "aws_lb_target_group" "_5" {
#   for_each = local.target-groups.new-york
#   provider = aws.new-york
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.new-york-vpc.id
# }

# resource "aws_lb_target_group" "_6" {
#   for_each = local.target-groups.sao-paulo
#   provider = aws.sao-paulo
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.sao-paulo-vpc.id
# }

# resource "aws_lb_target_group" "_7" {
#   for_each = local.target-groups.tokyo
#   provider = aws.tokyo
#   name     = each.key
#   port     = each.value.port
#   protocol = each.value.protocol
#   vpc_id   = aws_vpc.tokyo-vpc.id
# }

# target group attachment
# resource "aws_lb_target_group_attachment" "tg_attachment_a" {
#  target_group_arn = aws_lb_target_group.my_tg_a.arn
#  target_id        = aws_instance.instance_a.id
#  port             = 80
# }

# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc
