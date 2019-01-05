resource "template_dir" "vars" {
  source_dir      = "${path.module}/template"
  destination_dir = "${path.module}/tmp/"

  vars {
    EC2_INSTANCE_TAG = "${var.EC2_INSTANCE_TAG}"
    RETENTION_DAYS   = "${var.RETENTION_DAYS}"
    REGIONS          = "${join(",", var.regions)}"
  }
}
