module "ebsnapshot" {
  source          = "../../"
  common_tags     = var.common_tags
  snapshot_name   = local.snapshot_name
  cron_expression = var.cron_expression
  regions         = var.regions
}
