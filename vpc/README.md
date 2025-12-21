# Terraform AWS VPC Module

## 📌 Overview
This module creates a **highly reusable, production-ready AWS VPC** with:
- Public and Private Subnets
- Internet Gateway
- Optional NAT Gateway
- Clean tagging strategy
- No hardcoded values

Designed following **Terraform & AWS best practices**.

---

## 🏗 Resources Created
- AWS VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway (optional)
- Elastic IP (for NAT)

---

## 📥 Usage Example

```hcl
module "vpc" {
  source = "./vpc-module"

  vpc_name     = "myapp-vpc"
  environment  = "dev"
  vpc_cidr     = "10.0.0.0/16"

  availability_zones = ["ap-south-1a", "ap-south-1b"]

  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Owner = "platform-team"
    Project = "myapp"
  }
}
