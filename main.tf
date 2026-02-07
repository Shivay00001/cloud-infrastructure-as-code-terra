terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Replace with actual backend config for production
  # backend "s3" {
  #   bucket         = "tf-state-bucket"
  #   key            = "global/s3/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "tf-state-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "compute" {
  source = "./modules/compute"

  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  instance_type = var.instance_type
  environment   = var.environment
}
