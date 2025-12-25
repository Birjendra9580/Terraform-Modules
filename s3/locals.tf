locals {
  common_tags = merge(
    {
        Managedby = "Terraform"
    },
    var.tags
  )
}