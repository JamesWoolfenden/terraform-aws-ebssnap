# terraform-aws-ebssnap

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-ebssnap/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-ebssnap)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-ebssnap.svg)](https://github.com/JamesWoolfenden/terraform-aws-ebssnap/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-ebssnap.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-ebssnap/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-ebssnap/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-ebssnap&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-ebssnap/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-ebssnap&benchmark=INFRASTRUCTURE+SECURITY)

A Terraform module to automate the taking of backup snapshots.

---

## Usage

Include this repository as a module in your existing terraform code:

```HCL
module "ebsnapshot" {
  source          = "JamesWoolfenden/ebssnap/aws"
  version         = "0.2.9"
  common_tags     = var.common_tags
  snapshot_name   = local.snapshot_name
  cron_expression = var.cron_expression
  regions         = var.regions
}
```

Creates a lambda and cloudwatch event to look for any instances that have the specified tag and then takes a snapshot of that volume.
This is a heavily modified version of this module: <https://github.com/kgorskowski/ebs_bckup>

Set up your Terraform **tf.vars** file to look something like:

```HCL
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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.ebsbackuptimer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.runebsbackuplambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.ebsbackuplambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ebsbackuplambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_function.ebsbackup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch_to_call](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [random_string.label](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [template_dir.vars](https://registry.terraform.io/providers/hashicorp/template/latest/docs/resources/dir) | resource |
| [archive_file.lambda_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy_document.ebsbackuplambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_EC2_INSTANCE_TAG"></a> [EC2\_INSTANCE\_TAG](#input\_EC2\_INSTANCE\_TAG) | Tag to identify the EC2 target instances of the Lambda Function | `string` | `"Backup"` | no |
| <a name="input_RETENTION_DAYS"></a> [RETENTION\_DAYS](#input\_RETENTION\_DAYS) | Numbers of Days that the EBS Snapshots will be stored (INT) | `string` | `5` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Implements the common tags scheme | `map(any)` | n/a | yes |
| <a name="input_cron_expression"></a> [cron\_expression](#input\_cron\_expression) | Cron expression for firing up the Lambda Function | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Which Regions to apply the snapshots too | `list(any)` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | n/a | `string` | `"python2.7"` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | The name of the snapshot | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Lambda Timeout in seconds | `number` | `60` | no |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | Xray tracing mode | `string` | `"Active"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda"></a> [lambda](#output\_lambda) | n/a |
| <a name="output_role"></a> [role](#output\_role) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-ebssnap&url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-ebssnap&url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
[share_email]: mailto:?subject=terraform-aws-ebssnap&body=https://github.com/JamesWoolfenden/terraform-aws-ebssnap
