# Cloud Infrastructure as Code (Terraform)

[![Terraform](https://img.shields.io/badge/Terraform-1.6-blueviolet.svg)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange.svg)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A **production-grade Infrastructure as Code (IaC) repository** for managing AWS cloud resources. Built with Terraform, this repository provides modular, reusable, and version-controlled infrastructure blueprints, following best practices for security, scalability, and maintainability.

## 🚀 Features

- **Modular Architecture**: Reusable modules for VPC, Compute (EC2), and Storage (S3).
- **Environment Separation**: Clean separation of configurations for `dev`, `staging`, and `prod` environments.
- **State Management**: Best practices for remote state storage and locking (S3/DynamoDB).
- **Security First**: Implementing VPC security groups, IAM roles, and encrypted storage by default.
- **Automated Workflows**: CI/CD pipelines for linting, planning, and applying infrastructure changes.
- **Standardized Tagging**: Consistent resource tagging across all infrastructure components.

## 📁 Project Structure

```
cloud-infrastructure-as-code-terra/
├── modules/
│   ├── vpc/          # VPC and networking modules
│   ├── compute/      # EC2 and Auto Scaling modules
│   └── storage/      # S3 and RDS modules
├── environments/
│   ├── dev/          # Development environment config
│   └── prod/         # Production environment config
├── .github/
│   └── workflows/    # Terraform CI/CD pipelines
├── main.tf           # Root module entrypoint
├── variables.tf      # Global variables
└── outputs.tf        # Global outputs
```

## 🛠️ Quick Start

```bash
# Clone
git clone https://github.com/Shivay00001/cloud-infrastructure-as-code-terra.git

# Initialize
terraform init

# Plan
terraform plan -var-file="environments/dev/terraform.tfvars"
```

## 📄 License

MIT License
