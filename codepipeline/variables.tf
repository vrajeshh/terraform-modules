variable "owner" {
  description = "owner of github repo"
  default     = "rohankadu"
}

variable "repo" {
  description = "github repository name"
  default     = "aws-test"
}

variable "branch" {
  description = "branch name of github repo"
  default     = "master"
}

variable "github_token" {
  default = "1d0d08fbf13b3cada81e58e96ece7632505328d8"
}

variable "s3_bucket" {
  description = "s3 bucket name used for codepipeline"
  default     = ""
}

variable "codepipeline_role" {
}

variable "account_id" {
  default = "700738850588"
}

variable "env" {
}

variable "build_project_name" {
}

variable "project_name" {
}
