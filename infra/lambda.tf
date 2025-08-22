# Role para a Lambda
resource "aws_iam_role" "lambda_role" {
  name               = "${var.project_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

# Política básica de logs
resource "aws_iam_role_policy_attachment" "basic_exec" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Função Lambda apontando para o S3 (build.zip)
resource "aws_lambda_function" "hello" {
  function_name = var.project_name
  role          = aws_iam_role.lambda_role.arn
  runtime       = "nodejs20.x"
  handler       = "index.handler"

  s3_bucket         = var.bucket_name
  s3_key            = var.artifact_key
  s3_object_version = data.aws_s3_object.lambda_zip.version_id

  environment {
    variables = {
      STAGE = "prod"
    }
  }
}
