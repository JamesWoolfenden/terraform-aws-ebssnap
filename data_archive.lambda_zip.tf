data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/tmp"
  output_path = "${path.module}/lambda/ebsbackup-${random_string.label.result}.zip"
  depends_on  = [template_dir.vars]
}
