# ALB Terraform Module

This module deploys an AWS Application Load Balancer (ALB) with:
- Target group
- Listener
- Health checks
- Company-standard tagging
- Data sources
- Best-practice structure

## Inputs

| Name | Type | Description |
|------|------|-------------|
| name | string | ALB Name |
| vpc_id | string | VPC ID |
| subnet_ids | list(string) | Public subnets |
| security_group_ids | list(string) | Security groups |
| target_port | number | App port |

## Outputs

| Output | Description |
|--------|-------------|
| alb_dns_name | ALB DNS name |
| alb_arn | ALB ARN |
| target_group_arn | Target group ARN |
