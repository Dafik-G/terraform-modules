output "role_arn" {
  value = aws_iam_role.ec2-role.arn
}

output "policy_arn" {
  value = aws_iam_policy.s3-read-only.arn
}