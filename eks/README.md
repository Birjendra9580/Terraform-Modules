# Terraform AWS EKS Module

This Terraform module provisions a **secure, scalable, and production-ready Amazon EKS cluster**

---

## 🚀 Features

- Managed EKS Control Plane
- Managed Node Groups (On-Demand / Spot)
- IAM Roles for Service Accounts (IRSA)
- KMS Encryption for Kubernetes Secrets
- AWS-managed EKS Addons
- No hard-coded infrastructure values
- Multi-environment support (dev / stage / prod)
- Terraform 1.5+ compatible

---

## 🏗 Architecture

- VPC is created **outside** this module
- EKS module **consumes VPC outputs via remote state**
- Each environment has its own backend & state file

---

## 📂 Module Structure

.
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── versions.tf
├── locals.tf
├── data.tf
├── iam.tf
├── security-groups.tf
├── kms.tf
├── oidc.tf
├── addons.tf
├── node-groups.tf
├── tags.tf
└── README.md

---

## 🔐 Security

- Secrets encrypted using AWS KMS
- Private API endpoint enabled by default
- IRSA enabled for fine-grained IAM access
- No static credentials or hard-coded ARNs

---

## 📦 Inputs

| Name | Description | Type |
|----|----|----|
| region | AWS region | string |
| cluster_name | EKS cluster name | string |
| cluster_version | Kubernetes version | string |
| vpc_id | VPC ID (from remote state) | string |
| private_subnet_ids | Private subnets | list(string) |
| node_groups | Node group definitions | map(object) |
| tags | Resource tags | map(string) |

---

## 📤 Outputs

| Name | Description |
|----|----|
| cluster_name | EKS cluster name |
| cluster_endpoint | API endpoint |
| oidc_provider_arn | IRSA provider ARN |

---

## ✅ Recommended Usage

- Use **remote state** to fetch VPC outputs
- Maintain **separate state per environment**
- Do not hard-code infrastructure values

---

## 🧪 Tested With

- Terraform >= 1.5
- AWS Provider >= 5.x
- Kubernetes 1.27 – 1.29

---



