resource "aws_kms_key" "eks" {
    description = "This is eks secrets encryption key"
    enable_key_rotation = true
    deletion_window_in_days = 30         
    tags = var.tags
}

