output "codebuild_role" {
  value = aws_iam_role.codebuild_role.name
}

output "codepipeline_role" {
  value = aws_iam_role.codepipeline_role.name
}
