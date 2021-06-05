resource "aws_cloudwatch_event_rule" "ebsbackuptimer" {
  name                = "ebs_bckup_event_${random_string.label.result}"
  description         = "Cronlike scheduled Cloudwatch Event for creating and deleting EBS Snapshots"
  schedule_expression = "cron(${var.cron_expression})"
}
