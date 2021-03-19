resource "aws_iam_role_policy" "ebsbackuplambda" {
  name   = "ebsbackuplambda-${random_string.label.result}"
  role   = aws_iam_role.ebsbackuplambda.id
  policy = data.aws_iam_policy_document.ebsbackuplambda.json
}

data "aws_iam_policy_document" "ebsbackuplambda" {
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
