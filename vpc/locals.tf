locals {
  common_tags = merge(
    {
        Environment = var.environment
        ManagedBy = "Terraform"
        Module = "VPC"
    },
    var.tags
  )
}