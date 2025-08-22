terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55"
    }
  }
}

provider "aws" {
  region = var.region
}

# Bucket versionado para guardar o build.zip (opcional)
resource "aws_s3_bucket" "artifact" {
  count  = var.create_artifact_bucket ? 1 : 0
  bucket = var.artifact_bucket_name != null ? var.artifact_bucket_name : "${var.project_name}-artifacts"
}

resource "aws_s3_bucket_versioning" "artifact" {
  count  = var.create_artifact_bucket ? 1 : 0
  bucket = aws_s3_bucket.artifact[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

# Descobrir o bucket onde o build.zip será enviado
locals {
  artifact_bucket_name = var.create_artifact_bucket ? aws_s3_bucket.artifact[0].bucket : var.artifact_bucket_name
}

# Objeto S3 do artefato (carregado pelo pipeline antes do apply)
data "aws_s3_object" "lambda_zip" {
  bucket = local.artifact_bucket_name
  key    = var.artifact_key
}
