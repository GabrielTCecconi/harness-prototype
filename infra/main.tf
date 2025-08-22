terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55"
    }
  }
  
  backend "s3" {
    bucket         = "tf-backend-cecconi"
    key            = "hello-lambda-api/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}


data "aws_s3_object" "lambda_zip" {
  bucket = var.artifact_bucket_name
  key    = var.artifact_key
}