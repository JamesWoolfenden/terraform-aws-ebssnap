common_tags = {
  application = "terraform"
  module      = "auto-ebs-snapshot"
  environment = "develop"
}

EC2_INSTANCE_TAG = "Backup"
RETENTION_DAYS   = 10
cron_expression  = "45 1 * * ? *"
regions          = ["eu-west-1", "eu-west-2", "eu-west-3"]
