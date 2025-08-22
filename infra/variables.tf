variable "project_name" {
  type    = string
  default = "hello-lambda-api"
}

variable "region" {
  type    = string
  default = "sa-east-1"
}

# Artefato que o pipeline envia para o S3
variable "bucket_name" {
  type    = string
  default = "tf-backend-cecconi"  # mesmo bucket do backend
}

variable "artifact_key" {
  type    = string
  default = "hello-lambda-api/builds/build.zip"
}
