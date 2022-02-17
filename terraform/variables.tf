# -----------------------------------------------------------------------------
# Variables: Cloud Provider
# -----------------------------------------------------------------------------

variable "provider_region" {
  type = list(string)
  default = ["us-east-1", "us-west-2"] 
  description = "AWS regions"
}

variable "provider_az" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "AWS avalability zones"
}

variable "provider_access_key" {
  description = "AWS access key"
}

variable "provider_secret_key" {
  description = "AWS secret key"
}

# -----------------------------------------------------------------------------
# Variables: Main
# -----------------------------------------------------------------------------
variable "namespace" {
  description = "AWS resource namespace/prefix"
  default     = "dev"
}

variable "resource_tag_name" {
  description = "Resource tag name for cost tracking"
  default     = "kops-project"
}

variable "private_key" {
  description = "EC2 private key"
  default     = "kops_project_keypair"
}

variable "public_key" {
  description = "EC2 public key"
  default     = "kops_project_keypair.pub"
}

variable "ec2_user" {
  description = "EC2 ssh user"
  default     = "ec2_user"
}
