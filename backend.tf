#
# S3 backend
#

terraform {
  backend "s3" {
    bucket                  = "infra-check.terraform.state.us-east-1"
    key                     = "terraform12/sandbox-ap-southeast-1.tfstate"
    region                  = "us-east-1"
    profile                 = "default"
    shared_credentials_file = "~/.aws/credentials"
  }
}

