provider "aws" {
  region = var.aws_region
}


# Centralizar o arquivo de controle de estado do terraform
# Bucket terraform precisa existir - ser criado manualmente no S3
terraform {
  backend "s3" {
    bucket = "terraform-state-adriano"
    key    = "state/deltalake/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}