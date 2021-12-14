resource "aws_elastic_beanstalk_application" "application" {
  name        = "lcdd-dev-test-app-tf"
}
resource "aws_elastic_beanstalk_environment" "environment" {
  name                = "LcddDevTestApp-env-tf"
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = var.platform

setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = aws_iam_instance_profile.ec2_instance_profile.name
      }
      
setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = aws_vpc.vpc.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "true"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = aws_subnet.public-subnet-1.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = aws_subnet.private-subnet-1.id
  }
}
