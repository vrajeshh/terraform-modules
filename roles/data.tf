data "template_file" "codebuild_access_policy" {
  template = file("${path.module}/codebuild_access_policy.tpl.json")

  vars = {
    s3_bucket = var.s3_bucket
  }
}

data "template_file" "codepipeline_access_policy" {
  template = file("${path.module}/codepipeline_access_policy.tpl.json")

  vars = {
    s3_bucket = var.s3_bucket
  }
}

