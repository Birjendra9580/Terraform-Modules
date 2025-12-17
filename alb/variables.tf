variable "name" {
    description = " Name of the ALB"
    type = string
}

variable "internal" {
    type = bool
    default = false
}

variable "vpc_id" {
    description = "VPC ID where ALB will deployed"
    type = string
}

variable "subnet_ids" {
    description = "List of public subnet Ids"
    type = list(string)
}

variable "security_group_ids" {
    description = "List of security group atteched to ALB"
    type = list(string)
}

variable "target_port" {
    description = "Ports for target group"
    type = number
}

variable "tags" {
    description = "Tag to apply"
    type = map(string)
    default = {}  
}