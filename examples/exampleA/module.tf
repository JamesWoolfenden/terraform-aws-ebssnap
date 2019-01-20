module "ebsnapshot" {
  source          = "github.com/jameswoolfenden/terraform-aws-autoebssnapshot"
  common_tags     = "${var.common_tags}"
  snapshot_name   = "${local.snapshot_name}"
  cron_expression = "${var.cron_expression}"
  regions         = "${var.regions}"
}
