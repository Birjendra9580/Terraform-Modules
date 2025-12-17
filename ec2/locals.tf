locals {
    common_tages = merge(
        {
            Project = var.project
            Environment = var.environment
            ManagedBy = "Terraform"
            owner = var.owner
        },
        var.tags
    )

    # ec2 name formate - project-env-name
    instance_name_formatted = "${var.project}-${var.environment}-${var.instance_name}"
}