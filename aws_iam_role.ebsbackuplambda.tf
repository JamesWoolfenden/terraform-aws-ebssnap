resource "aws_iam_role" "ebsbackuplambda" {
  name = "ebsbackuplambda-${random_string.label.result}"

  assume_role_policy = <<HEREDOC
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
HEREDOC
}
