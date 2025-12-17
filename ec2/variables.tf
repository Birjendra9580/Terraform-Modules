variable "project" {
    description = "project name for tagging"
    type = string
}

variable "environment" {
    description = "Environment: dev/stage/prod"
    type = string
}

variable "owner" {
    description = "owner or team name"
    type = string
}

variable "region" {
    description = "Region where ec2-instance will created"
    type = string
}

variable "ami_id" {
    description = "ami_id which used on ec2-instance"
    type = string
    default = ""
}

variable "instance_name" {
    description = "instance name for this ec2 instance"
    type = string
}

variable "instance_type" {
    description = "Instance type for this ec2-instance"
    type = string
    default = "t3.micro"
}

variable "subnet_id" {
    description = "subnet id for this ec2-instance"
    type = string
    default = ""  
}

variable "vpc_id" {
    description = "vpc_id for this ec2 instance"
    type = string
}

variable "key_name" {
    description = "key name for this ec2-instance"
    type = string
    default = ""  
}

variable "enable_public_ip" {
    description = "ip addresh for this ec2 instance"
    type = bool
    default = false
}

variable "allowed_ssh_ips" {
    description = "allowed inbound ports for this ec2 instance"
    type = list(string)
    default = []
}

variable "tags" {
    description = "tags for the ec2 instance"
    type = map(string)
    default = {}  
}