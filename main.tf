resource "aws_iam_role" "ec2-role" {
  assume_role_policy = jsonencode(
    {
      version = "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole"
          "Effect" : "Allow",
          "Principal" = {
            "Service" = var.role-service
          }
        }
      ]
    }
  )
  name = var.role_name
  tags = {
    Name = var.role_name
    Environment = var.environment
  }
}
resource "aws_iam_policy" "s3-read-only" {
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket",
        ],
        "Resource" : "arn:aws:s3:::var.resource-s3bucket"
      }
    ]
  })
  name = var.policy_name
  tags = {
    Name = var.policy_name
    Environment = var.environment
    }
}

resource "aws_iam_role_policy_attachment" "attach-policy" {
  role       = aws_iam_role.ec2-role.role_name
  policy_arn = aws_iam_policy.s3-read-only.arn
}
