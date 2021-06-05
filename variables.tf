variable "EC2_INSTANCE_TAG" {
  type        = string
  default     = "Backup"
  description = "Tag to identify the EC2 target instances of the Lambda Function"
}

variable "RETENTION_DAYS" {
  type        = string
  default     = 5
  description = "Numbers of Days that the EBS Snapshots will be stored (INT)"
}

variable "cron_expression" {
  type        = string
  description = "Cron expression for firing up the Lambda Function"
}

variable "regions" {
  type        = list(any)
  description = "Which Regions to apply the snapshots too"
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "snapshot_name" {
  type        = string
  description = "The name of the snapshot"
}

variable "tracing_mode" {
  description = "Xray tracing mode"
  default     = "Active"
  type        = string
}

variable "runtime" {
  default = "python2.7"
}

variable "timeout" {
  type        = number
  description = "Lambda Timeout in seconds"
  default     = 60
}
