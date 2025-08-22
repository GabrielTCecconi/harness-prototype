variable "project_name" {
  type    = string
  default = "hello-lambda-api"
}

variable "region" {
  type    = string
  default = "sa-east-1"
}

# Artefato que o pipeline envia para o S3
variable "artifact_bucket_name" {
  type    = string
  default = null
  validation {
    condition     = var.create_artifact_bucket || (var.artifact_bucket_name != null && var.artifact_bucket_name != "")
    error_message = "Defina artifact_bucket_name quando create_artifact_bucket = false."
  }
}

variable "artifact_key" {
  type    = string
  default = "build.zip"
}

# Opcional: se já existir bucket, defina o nome e não crie um novo
variable "create_artifact_bucket" {
  type    = bool
  default = true
}
