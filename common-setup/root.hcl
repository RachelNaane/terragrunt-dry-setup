remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
  }
  config = {
    bucket         = "terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = local.aws_region
}
EOF
}

locals {
  # envvars shared for all components
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # envvars specific for this component
  component_vars   = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))

  aws_region = local.environment_vars.locals.aws_region
}

# Global inputs that can be referenced by child configurations
inputs = merge(
  local.environment_vars.locals, 
  local.component_vars.locals
)