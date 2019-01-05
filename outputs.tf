output "aws_iam_role_arn" {
  value = "${aws_iam_role.ebsbackuplambda.arn}"
}

output "lambda_function_name" {
  value = "${aws_lambda_function.ebsbackup.function_name}"
}
