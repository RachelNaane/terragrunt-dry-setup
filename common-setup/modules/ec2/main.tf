variable "environment" {
  type        = string
  description = "The environment to create the VPC for"
}

variable "ami" {
  type        = string
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the EC2 instance"
}