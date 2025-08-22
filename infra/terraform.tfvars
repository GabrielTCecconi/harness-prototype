# Nome base dos recursos
project_name = "hello-lambda-api"

# Região
region = "us-east-1"

# Artefato gerado no CI (build.zip) e enviado ao S3
artifact_bucket_name   = "hello-lambda-api-artifacts-cecconi"
artifact_key           = "build.zip"

# Como o bucket é criado no estágio de CI, mantenha "false"
create_artifact_bucket = true
