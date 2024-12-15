include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id            = "vpc-fake"
    private_subnets   = ["subnet-fake"]
    security_group_id = "sg-fake"
  }
}

terraform {
  source = "${dirname(find_in_parent_folders("root.hcl"))}/modules/ec2"
}

inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  subnet_id           = dependency.vpc.outputs.private_subnets[0]
  security_group_id   = dependency.vpc.outputs.security_group_id

  instance_name = "${include.root.locals.env}-demo-instance"
}