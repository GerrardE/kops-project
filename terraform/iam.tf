# -----------------------------------------------------------------------------
# Resource: Iam Group, Policy & Policy Attachment
# -----------------------------------------------------------------------------

resource "aws_iam_group" "kops_project_group" {
  name = "${local.resource_name}-iam-group"
}

resource "aws_iam_policy" "kops_project_policy" {
  name  = "${local.resource_name}-iam-policy"
  policy = data.aws_iam_policy_document.kops_project_policy_document.json
  description = "Iam policy for kops_project"
}

resource "aws_iam_group_policy_attachment" "kops_project_policy_attachment" {
  group      = aws_iam_group.kops_project_group.name
  policy_arn = aws_iam_policy.kops_project_policy.arn
}

# -----------------------------------------------------------------------------
# Resource: Iam User, Policy & Policy Attachment
# -----------------------------------------------------------------------------
resource "aws_iam_user" "kops_project_user" {
  name = "${local.resource_name}-iam-user"
}

resource "aws_iam_access_key" "kops_project_user_access_key" {
  user = aws_iam_user.kops_project_user.name
}

resource "aws_iam_user_group_membership" "kops_project_user_group_membership" {
  user = aws_iam_user.kops_project_user.name
  groups = [aws_iam_group.kops_project_group.name]
}
