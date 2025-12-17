# fetch vpc id
data "aws_vpc" "selected" {
    id = var.vpc_id
}

# fetch subnes
# data "aws_subnets" "selected" {
#     ids = var.subnet_ids
# }

