variable "s3_bucket" {
}

variable "project_name" {
}

#variable "s3bucket_arn" {
#}

variable "vpc_id" {
  description = "default vpc id for codebuild config"
  default     = "vpc-85eeb1ff"
}

variable "subnet1_id" {
  description = "subnet 1 id for codebuild config"
  default    = "subnet-43e6340e"
}

variable "subnet2_id" {
  description = "subnet 2 id for codebuild config"
  default     = "subnet-bec8c7e2"
}

variable "sg1_id" {
  description = "security group id"
  default     = "sg-02d5de41f523756aa"
}

variable "sg2_id" {
  description = "security group id"
  default     = "sg-0384ca6feda2a600c"
}

variable "codebuild_role" {
}

variable "env" {
  description = "Current execution environment eg dev, stage, prod"
}

variable "account_id" {
  default = "700738850588"
}
