include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "${dirname(find_in_parent_folders("root.hcl"))}/modules/vpc"
}

inputs = {
  vpc_name = "${include.root.locals.env}-vpc"
}