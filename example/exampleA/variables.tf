variable "regions" {
  type = list
}

variable "common_tags" {
  type        = map
  description = "Implements the common tagging scheme"
}

variable "EC2_INSTANCE_TAG" {
  type        = string
  description = "The tag to look for on EC2 instances"
}

variable "RETENTION_DAYS" {
  type        = string
  description = "How long to keep the snapshot"
}

variable "cron_expression" {
  type        = string
  description = "Cron expression for schedule"
}

locals {
  snapshot_name = "${upper("${substr(var.common_tags["environment"], 0, 1)}-${var.common_tags["application"]}")}-SP"
}
