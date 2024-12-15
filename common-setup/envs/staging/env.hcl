locals {
  environment = "staging"
  aws_region  = "eu-central-1"

  tags = {
    Environment = "staging"
    Team        = "DevOps"
  }
}