variable "owner" {
  description = "owner of github repo"
  default     = "XXXXXXX"
}

variable "repo" {
  description = "github repository name"
  default     = "XXXXXXX"
}

variable "branch" {
  description = "branch name of github repo"
  default     = "master"
}

variable "github_token" {
  default = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "s3_bucket" {
  description = "s3 bucket name used for codepipeline"
  default     = ""
}

variable "codepipeline_role" {
}

variable "account_id" {
  default = "XXXXXXXXX"
}

variable "env" {
}

variable "build_project_name" {
}

variable "project_name" {
}
