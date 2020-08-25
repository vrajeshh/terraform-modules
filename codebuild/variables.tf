variable "s3_bucket" {
}

variable "project_name" {
}

#variable "s3bucket_arn" {
#}

variable "vpc_id" {
  description = "default vpc id for codebuild config"
  default     = "XXXXXXXX"
}

variable "subnet1_id" {
  description = "subnet 1 id for codebuild config"
  default    = "XXXXXXXXX"
}

variable "subnet2_id" {
  description = "subnet 2 id for codebuild config"
  default     = "XXXXXXXX"
}

variable "sg1_id" {
  description = "security group id"
  default     = "XXXXXXXX"
}

variable "sg2_id" {
  description = "security group id"
  default     = "XXXXXXXX"
}

variable "codebuild_role" {
}

variable "env" {
  description = "Current execution environment eg dev, stage, prod"
}

variable "account_id" {
  default = "XXXXXXXXX"
}
