resource "aws_lambda_function" "ebsbackup" {
  # checkov:skip=CKV_AWS_117: ADD REASON
  # checkov:skip=CKV_AWS_116: ADD REASON
  # checkov:skip=CKV_AWS_115: ADD REASON

  function_name    = "ebsbackup_lambda_${random_string.label.result}"
  filename         = "${path.module}/lambda/ebsbackup-${random_string.label.result}.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  role             = aws_iam_role.ebsbackuplambda.arn
  runtime          = var.runtime
  handler          = "ebs_bckup.lambda_handler"
  timeout          = var.timeout
  publish          = true
  depends_on       = [template_dir.vars]

  tags = var.common_tags
  tracing_config {
    mode = var.tracing_mode
  }
}
