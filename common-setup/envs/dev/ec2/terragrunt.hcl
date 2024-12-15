include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/ec2.hcl"
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
  source = "${dirname(find_in_parent_folders())}/modules/ec2"
}

inputs = {
  instance_name = "dev-demo-instance"
  instance_type = "t3.micro" 
  
  vpc_id              = dependency.vpc.outputs.vpc_id
  subnet_id           = dependency.vpc.outputs.private_subnets[0]
  security_group_id   = dependency.vpc.outputs.security_group_id
}