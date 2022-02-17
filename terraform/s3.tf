# -----------------------------------------------------------------------------
# Resources: S3
# -----------------------------------------------------------------------------
resource "aws_s3_bucket" "kops_project_bucket" {
  bucket        = "${local.resource_name}-artifact-store-${random_string.postfix.result}"
  acl           = "private"
  force_destroy = true

  tags = {
    Environment = var.namespace
    Name        = var.resource_tag_name
  }
}
