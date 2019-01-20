## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| EC2_INSTANCE_TAG | Tag to identify the EC2 target instances of the Lambda Function | string | `Backup` | no |
| RETENTION_DAYS | Numbers of Days that the EBS Snapshots will be stored (INT) | string | `5` | no |
| common_tags | Implements the common tags scheme | map | - | yes |
| cron_expression | Cron expression for firing up the Lambda Function | string | - | yes |
| regions | Which Regions to apply the snapshots too | list | - | yes |
| snapshot_name | The name of the snapshot | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws_iam_role_arn | - |
| lambda_function_name | - |
