output "vpc_id" {
    description = "For desplay of vpc id"
    value = aws_vpc.this.id
}

output "public_subnet_ids" {
    description = "Public Subnet Id"
    value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    description = "Private Subnet Id"
    value = aws_subnet.private[*].id
}

output "vpc_cidr" {
    description = "cidr of vpc"
    value = aws_vpc.this.cidr_block
}