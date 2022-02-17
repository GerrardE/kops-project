# -----------------------------------------------------------------------------
# Data: AWS AMI
# -----------------------------------------------------------------------------
data "aws_ami" "kops_project_ami" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# -----------------------------------------------------------------------------
# Data: Iam Policy Document
# -----------------------------------------------------------------------------
data "aws_iam_policy_document" "kops_project_policy_document" {
  statement {
    sid = "1"
    actions = ["s3:*"]
    resources = [aws_s3_bucket.kops_project_bucket.arn]
    effect = "Allow"
  }
  statement {
    sid = "2"
    actions = ["vpc:*"]
    resources = [aws_vpc.kops_project_vpc.arn]
    effect = "Allow"
  }
  statement {
    sid = "3"
    actions = ["ec2:*"]
    resources = ["arn:aws:ec2:::*"]
    effect = "Allow"
  }
  statement {
    sid = "4"
    actions = ["iam:*"]
    resources = ["arn:aws:iam:::*"]
    effect = "Allow"
  }
}
