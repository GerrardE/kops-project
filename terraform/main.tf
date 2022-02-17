terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
  }

  backend "s3" {
    bucket = aws_s3_bucket.kops_project_bucket.bucket
    key    = aws_s3_bucket.kops_project_bucket.key
    region = var.provider_region[0]
  }

  required_version = "~> 1.0"
}

locals {
  resource_name = "${var.namespace}-${var.resource_tag_name}"
  k8s_cluster_name = "kops_project.k8s.local"
}

provider "aws" {
  region     = var.provider_region[0]
  access_key = var.provider_access_key
  secret_key = var.provider_secret_key
}

# -----------------------------------------------------------------------------
# Resources: Random string
# -----------------------------------------------------------------------------
resource "random_string" "postfix" {
  length  = 6
  number  = false
  upper   = false
  special = false
  lower   = true
}
