output "role" {
  value = aws_iam_role.ebsbackuplambda
}

output "lambda" {
  value = aws_lambda_function.ebsbackup
}
