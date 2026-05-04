resource "aws_iam_role_policy" "ebsbackuplambda" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  name   = "ebsbackuplambda-${random_string.label.result}"
  role   = aws_iam_role.ebsbackuplambda.id
  policy = data.aws_iam_policy_document.ebsbackuplambda.json
}
data "aws_iam_policy_document" "ebsbackuplambda" {
  # checkov:skip=CKV_AWS_356: IAM policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  #checkov:skip=CKV_AWS_111:A general role for many ec2 instances
  #checkov:skip=CKV_AWS_109:A general role for many ec2 instances
  statement {
    actions = [
      "logs:*",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    actions = [
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
      "ec2:CreateTags",
      "ec2:ModifySnapshotAttribute",
      "ec2:ResetSnapshotAttribute",
      "ec2:Describe*",
    ]

    resources = [
      "*",
    ]
  }
}
