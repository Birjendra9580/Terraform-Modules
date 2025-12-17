locals {
  tags = merge(
    var.tags,
    {
        module = "ALB"
    }
  )
}