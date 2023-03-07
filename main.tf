terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }

  }

  # Defini onde o state será salvo
  backend "s3" {
    bucket = "bucket-aprendizado-udemy"
    key    = "aws-pipeline/terraform.tfstate" #path criado na bucket 
    region = "us-east-1"
  }
}

# AWS Config
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = local.common_local_tags
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucket-aprendizado-udemy"
    key    = "aws-vpc/terraform.tfstate" #path criado na bucket 
    region = "us-east-1"
  }
}