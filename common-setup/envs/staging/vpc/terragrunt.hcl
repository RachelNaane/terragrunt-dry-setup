include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/vpc.hcl"
  expose = true
}

terraform {
  source = "${dirname(find_in_parent_folders())}/modules/vpc"
}

inputs = {
  vpc_cidr = "10.1.0.0/16"
  vpc_name = "staging-vpc"
}
