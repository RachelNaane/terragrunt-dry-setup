variable "environment" {
  type        = string
  description = "The environment to create the VPC for"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "The CIDR block for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "The CIDR block for the private subnets"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the VPC"
}