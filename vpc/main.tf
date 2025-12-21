resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
        Name = var.vpc_name
    }
  )
}

# Internet gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags   = local.common_tags

}

# Public subnet
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
        Name = "${var.vpc_name}-public-${count.index + 1}"
        Tier = "public"
    }
  )
}

# Private subnet
resource "aws_subnet" "private" {
  count                   = length(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
        Name = "${var.vpc_name}-private-${count.index + 1}"
        Tier = "private"
    }
  )
}

# Elastic Ip for Nat
resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
  domain   = "vpc"

  tags = local.common_tags
}

# Nat gateway
resource "aws_nat_gateway" "this" {
  count = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = local.common_tags
}