variable "region" {
  default = "us-east-1"
}

variable "codepipeline_bucket" {
  description = "aws codepipeline bucket name"
  default     = "XXXXXXXXXXXX"
}

variable "tags" {
  default = { Environment = "Sandbox" }
}

variable "account_id" {
  description = "aws account id"
  default     = "XXXXXXXXXXX"
}

variable "env" {
  description = "environment for project"
  default     = "sandbox"
}

variable "project_name" {
  description = "pipeline project name"
  default     = "XXXXX"
}
