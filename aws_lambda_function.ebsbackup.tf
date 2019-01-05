resource "aws_lambda_function" "ebsbackup" {
  function_name    = "ebsbackup_lambda_${random_string.label.result}"
  filename         = "${path.module}/lambda/ebsbackup-${random_string.label.result}.zip"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  role             = "${aws_iam_role.ebsbackuplambda.arn}"
  runtime          = "python2.7"
  handler          = "ebs_bckup.lambda_handler"
  timeout          = "60"
  publish          = true
  depends_on       = ["template_dir.vars"]

  tags = "${merge(var.common_tags
  , map("Name", "${var.snapshot_name}")
  )}"
}
