variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
}

variable "vpc_name" {
    description = "Name of VPC"
    type = string
}

variable "environment" {
    description = "Environment name of VPC(dev, stage, prod)"
    type = string
}

variable "availability_zones" {
    description = "List of availability zone"
    type = list(string)
}

variable "public_subnet_cidrs" {
    description = "cidr block of public subnet"
    type = list(string)
}

variable "private_subnet_cidrs" {
    description = "cidr block of private subnet"
    type = list(string)
}

variable "enable_nat_gateway" {
    description = "Enable nat gateway"
    type = bool
    default = true
}

variable "tags" {
    description = "tags for resources"
    type = map(string)
    default = {}
}