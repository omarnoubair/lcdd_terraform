# Parse through the list using count
resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  role       = aws_iam_role.ec2_access_role.name
  count      = length(var.iam_policy_arn)
  policy_arn = var.iam_policy_arn[count.index]
}
