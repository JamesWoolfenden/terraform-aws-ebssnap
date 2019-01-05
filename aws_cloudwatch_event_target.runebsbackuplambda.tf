resource "aws_cloudwatch_event_target" "runebsbackuplambda" {
  rule      = "${aws_cloudwatch_event_rule.ebsbackuptimer.name}"
  target_id = "${aws_lambda_function.ebsbackup.id}"
  arn       = "${aws_lambda_function.ebsbackup.arn}"
}
