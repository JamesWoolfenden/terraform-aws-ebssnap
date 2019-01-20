Creates a lambda and cloudwatch event to look for any instances that have the specfied tag and then takes a snapshot of that volume.
This is a heavily modified version of this module: <https://github.com/kgorskowski/ebs_bckup>

Set up your Terraform tf vars file to look something like:

``` HCL
common_tags = {
    application = "terraform"
    module      = "auto-ebs-snapshot"
    environment = "develop"
}

EC2_INSTANCE_TAG = "Backup"
RETENTION_DAYS   = 10
cron_expression  = "45 1 * * ? *"
regions          = ["eu-west-1","eu-west-2","eu-west-3"]
```
