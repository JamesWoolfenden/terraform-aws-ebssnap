resource "aws_lambda_permission" "allow_cloudwatch_to_call" {
  statement_id  = "AllowExecutionFromCloudWatch_${random_string.label.result}"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.ebsbackup.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.ebsbackuptimer.arn}"
}
