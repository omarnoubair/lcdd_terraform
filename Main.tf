terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# definition provider
provider "aws" {
  region = "${var.region}"
  # Champs rempli dans les variable de terraform cloud
  # access_key = "AWS_ACCESS_KEY_ID"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
}