#
# AWS environment
#

provider "aws" {
  version = "3.2.0"
  region  = var.region
}

module "s3" {
  source      = "git::https://github.com/SPHTech/sph-terraform-modules.git//aws/s3"
  bucket_name = var.codepipeline_bucket
  tags        = var.tags

}

module "roles" {
  source       = "./roles"
  s3_bucket    = "${module.s3.bucket_name}"
  project_name = "stomp"
}

module "codebuild" {
  source         = "./codebuild"
  project_name   = var.project_name
  codebuild_role = "${module.roles.codebuild_role}"
  s3_bucket      = "${module.s3.bucket_name}"
  env            = var.env
}

module "codepipeline" {
  source             = "./codepipeline"
  s3_bucket          = "${module.s3.bucket_name}"
  codepipeline_role  = "${module.roles.codepipeline_role}"
  env                = var.env
  project_name       = var.project_name
  build_project_name = "${module.codebuild.build_project_name}"
}

