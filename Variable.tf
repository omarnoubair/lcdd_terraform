###################################################################################
###################################################################################
###########                                                   #####################
###########                     VARIABLE                      #####################
###########                                                   #####################
###################################################################################
###################################################################################

variable "region" {
  default       = "eu-west-3"
  description   = "AWS Region"
  type          = string
}
variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}
variable "public-subnet-1-cidr" {
  default       = "10.0.0.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}
variable "private-subnet-1-cidr" {
  default       = "10.0.1.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}
variable "private-subnet-2-cidr" {
  default       = "10.0.2.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}
variable "ssh-location" {
  default       = "0.0.0.0/0"
  description   = "IP Adress that can SSH Into EC2 Instance"
  type          = string
}
variable "database-instance-prod-class" {
  default       = "db.t2.micro"
  description   = "The Database Instance Type"
  type          = string
}
variable "database-instance-prod-identifier" {
  default       = "lcdddb-tf"
  description   = "The Database Instance Identifier"
  type          = string
}
variable "multi-az-deployment" {
  default       = false
  description   = "Create a Standly DB Instance"
  type          = bool
}
variable "database-user" {
  default       = "user"
  description   = "Database User"
  type          = string
} 
variable "database-pwd" {
  default       = "password"
  description   = "Database Password"
  type          = string
} 
variable "subnet-1" {
  default       = "eu-west-3a"
  description   = "Zone de disponibilité Subnet 1"
  type          = string
} 
variable "subnet-2" {
  default       = "eu-west-3b"
  description   = "Zone de disponibilité Subnet 2"
  type          = string
} 
variable "subnet-3" {
  default       = "eu-west-3c"
  description   = "Zone de disponibilité Subnet 3"
  type          = string
} 

# Define policy ARNs as list
variable "iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type = list
  default = [
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess", 
  "arn:aws:iam::aws:policy/IAMFullAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/CloudFrontFullAccess",
  "arn:aws:iam::aws:policy/AWSElementalMediaPackageFullAccess",
  "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator",
  "arn:aws:iam::aws:policy/AmazonCognitoPowerUser",
  "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess",
  "arn:aws:iam::aws:policy/AmazonOpenSearchServiceFullAccess",
  "arn:aws:iam::aws:policy/AWSElementalMediaLiveFullAccess",
]
}

#Define running platform of the application
variable "platform" {
  default       = "64bit Amazon Linux 2 v4.2.8 running Tomcat 8.5 Corretto 8"
  description   = "Tomcat platform"
  type          = string
}

