resource "aws_lambda_function" "tf_lambda" {
  filename      = "./lambdas/lambda.zip"
  function_name = "tf-lambda"
  role          = aws_iam_role.tf_lambda_role.arn
  handler       = "index.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("./lambdas/lambda.zip")

  runtime = "nodejs12.x"

  environment {
    variables = {
      env = "test"
    }
  }
}
