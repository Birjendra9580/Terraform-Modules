# Terraform S3 Module

## Features
- Secure by default
- No hard-coded values
- Production ready
- Supports encryption, versioning, lifecycle, logging

## Usage

```hcl
module "s3" {
  source = "./modules/s3"

  bucket_name = "my-prod-app-bucket"

  versioning_enabled = true
  encryption_type    = "AES256"

  lifecycle_rules = [
    {
      id               = "log-expiry"
      enabled          = true
      prefix           = "logs/"
      expiration_days  = 90
    }
  ]

  tags = {
    Environment = "prod"
    Owner       = "platform-team"
    Project     = "my-app"
  }
}
