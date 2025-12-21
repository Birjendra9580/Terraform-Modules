variable "region" {
    description = "Region where resources will create"
    type = string
}

variable "cluster_name" {
    description = "Name of cluster"
    type = string
}

variable "cluster_version" {
    description = "Version of cluster"
    type = string
}

variable "vpc_id" {
    description = "This provide the vpc id"
    type = string
}

variable "private_subnet_ids" {
    description = "Provide the private subnet ids"
    type = list(string)
}

variable "public_subnet_ids" {
    description = "Provide the public subnet ids"
    type = list(string)
    default = []
}

variable "endpoint_private_access" {
    type = bool
    default = true
}

variable "endpoint_public_access" {
    type = bool
    default = true
}

variable "node_groups" {
    description = "Managed node group configration"
    type = map(object({
      instance_types = list(string)
      desired_size   = number
      min_size       = number
      max_size       = number
      capacity_type  = string
    }))
}