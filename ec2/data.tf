data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# for vpc
data "aws_vpc" "selectd" {
  id = var.vpc_id
}

# for subnet
data "aws_subnet" "selected"{
  id = var.subnet_id
}