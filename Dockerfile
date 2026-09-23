# This repo is Terraform IaC (VPC + compute modules), not a Go service.
# Validate locally: terraform init -backend=false && terraform validate
FROM hashicorp/terraform:1.9
WORKDIR /app
COPY . .
RUN terraform init -backend=false && terraform validate
