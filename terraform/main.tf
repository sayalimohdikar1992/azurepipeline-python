provider "aws" {
  profile = "default"
  region = "us-west-2"
}


# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

resource "aws_lambda_function" "test_lambda" {
  image_uri      = "482780835707.dkr.ecr.us-west-2.amazonaws.com/azurepipeline-python:latest"
  function_name = "sys75_lambda_function_name_test"
  role          = "arn:aws:iam::482780835707:role/iam_for_lambda"
#   handler       = "exports.test"
#   runtime = "python3.8"
  package_type = "Image"

}

resource "aws_lambda_function" "uat_lambda" {
  image_uri      = "482780835707.dkr.ecr.us-west-2.amazonaws.com/azurepipeline-python:latest"
  function_name = "sys75_lambda_function_name_uat"
  role          = "arn:aws:iam::482780835707:role/iam_for_lambda"
#   handler       = "exports.test"
#   runtime = "python3.8"
  package_type = "Image"

}