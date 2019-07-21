
# terraform-aws-ebssnap [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-ebssnap.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-ebssnap) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-ebssnap.svg)](https://github.com/JamesWoolfenden/terraform-aws-ebssnap/releases/latest)

A Terraform module to automate the taking of backup snapshots.

## Usage

Include this repository as a module in your existing terraform code:

``` HCL
module "ebsnapshot" {
  source          = "github.com/jameswoolfenden/terraform-aws-ebssnap"
  common_tags     = var.common_tags
  snapshot_name   = local.snapshot_name
  cron_expression = var.cron_expression
  regions         = var.regions
}
```

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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| EC2\_INSTANCE\_TAG | Tag to identify the EC2 target instances of the Lambda Function | string | `"Backup"` | no |
| RETENTION\_DAYS | Numbers of Days that the EBS Snapshots will be stored (INT) | string | `"5"` | no |
| common\_tags | Implements the common tags scheme | map | n/a | yes |
| cron\_expression | Cron expression for firing up the Lambda Function | string | n/a | yes |
| regions | Which Regions to apply the snapshots too | list | n/a | yes |
| snapshot\_name | The name of the snapshot | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_iam\_role\_arn |  |
| lambda\_function\_name |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-ebssnap&url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-ebssnap&url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_email]: mailto:?subject=terraform-aws-ebssnap&body=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
