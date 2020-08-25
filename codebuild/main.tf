resource "aws_codebuild_project" "codebuild" {
  name          = "${var.project_name}-${var.env}"
  description   = "${var.project_name}-${var.env}-codebuild_project"
  build_timeout = "5"
  service_role  = "arn:aws:iam::${var.account_id}:role/${var.codebuild_role}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type     = "S3"
    location = var.s3_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:1.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "SOME_KEY1"
      value = "SOME_VALUE1"
    }

    environment_variable {
      name  = "SOME_KEY2"
      value = "SOME_VALUE2"
      type  = "PARAMETER_STORE"
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.s3_bucket}/build-log"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/mitchellh/packer.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = "master"

  vpc_config {
    vpc_id = var.vpc_id

    subnets = [
      var.subnet1_id,
      var.subnet2_id,
    ]

    security_group_ids = [
      var.sg1_id,
      var.sg2_id,
    ]
  }

  tags = {
    Environment = var.env
  }
}
