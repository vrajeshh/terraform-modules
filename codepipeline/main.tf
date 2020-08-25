resource "aws_codepipeline" "codepipeline" {
  name     = "${var.project_name}-${var.env}-pipeline"
  role_arn = "arn:aws:iam::${var.account_id}:role/${var.codepipeline_role}"

  artifact_store {
    location = var.s3_bucket
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.owner
        Repo       = var.repo
        Branch     = var.branch
        OAuthToken = var.github_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName   = var.build_project_name
        PrimarySource = "Source"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "CreateChangeSet"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CloudFormation"
      input_artifacts = ["source_output"]
      version         = "1"
      run_order       = "1"
      configuration = {
        ActionMode    = "CHANGE_SET_REPLACE"
        Capabilities  = "CAPABILITY_NAMED_IAM,CAPABILITY_AUTO_EXPAND"
        ChangeSetName = "cf-pipeline-set"
        RoleArn       = "arn:aws:iam::700738850588:role/cf-pipeline-stack-CloudformationDeployRole-4FB47GICJJ6"
        StackName     = "cf-pipeline-canary"
        TemplatePath  = "Source::test.yaml"
      }
    }
    action {
      name      = "ExecuteChangeSet"
      category  = "Deploy"
      owner     = "AWS"
      provider  = "CloudFormation"
      run_order = "2"
      version   = "1"
      configuration = {
        ActionMode    = "CHANGE_SET_EXECUTE"
        ChangeSetName = "cf-pipeline-set-tf-test"
        RoleArn       = "arn:aws:iam::700738850588:role/cf-pipeline-stack-CloudformationDeployRole-4FB47GICJJ6"
        StackName     = "cf-pipeline-canary-tf-test"
      }
    }
  }
}

