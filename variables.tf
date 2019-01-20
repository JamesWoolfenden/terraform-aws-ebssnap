variable "EC2_INSTANCE_TAG" {
  default     = "Backup"
  description = "Tag to identify the EC2 target instances of the Lambda Function"
}

variable "RETENTION_DAYS" {
  default     = 5
  description = "Numbers of Days that the EBS Snapshots will be stored (INT)"
}

variable "cron_expression" {
  description = "Cron expression for firing up the Lambda Function"
}

variable "regions" {
  type        = "list"
  description = "Which Regions to apply the snapshots too"
}

variable "common_tags" {
  type        = "map"
  description = "Implements the common tags scheme"
}

variable "snapshot_name" {
  type        = "string"
  description = "The name of the snapshot"
}

# this is enables you to add dependancies
variable depends_on {
  default     = []
  description = "This is a way to make a module depends on, which isnt built in."
  type        = "list"
}
