# TERRAFORM-AWS-AUTO-EBS-SNAPSHOT

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| EC2_INSTANCE_TAG | Tag to identify the EC2 target instances of the Lambda Function | string | `Backup` | no |
| RETENTION_DAYS | Numbers of Days that the EBS Snapshots will be stored (INT) | string | `5` | no |
| common_tags |  | map | - | yes |
| cron_expression | Cron expression for firing up the Lambda Function | string | - | yes |
| regions |  | list | - | yes |
| snapshot_name |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws_iam_role_arn |  |
| lambda_function_name |  |

#   t e r r a f o r m - a w s - a u t o - e b s - s n a p s h o t  
 