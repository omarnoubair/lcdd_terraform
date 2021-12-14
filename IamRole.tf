resource "aws_iam_role" "ec2_access_role" {
  name               = "ec2-role-tf"
  assume_role_policy = file("AssumeRolePolicy.json")
}
