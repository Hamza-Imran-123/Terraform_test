resource "aws_iam_role" "this" {
  name = "my-iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "this" {
  name        = "my-iam-policy"
  description = "A test policy"
  policy      = var.iam_policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

output "iam_role_arn" {
  value = aws_iam_role.this.arn
}
