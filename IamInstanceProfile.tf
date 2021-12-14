resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name  = "ec2_instance_profile-tf"
  role = aws_iam_role.ec2_access_role.name
}
