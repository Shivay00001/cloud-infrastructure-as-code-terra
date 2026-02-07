variable "vpc_cidr" {}
variable "environment" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
