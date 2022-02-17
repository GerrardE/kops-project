# -----------------------------------------------------------------------------
# Resource: VPC
# -----------------------------------------------------------------------------
resource "aws_vpc" "kops_project_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${local.resource_name}-vpc"
  }
}

# -----------------------------------------------------------------------------
# Resource: Subnet
# -----------------------------------------------------------------------------
resource "aws_subnet" "kops_project_public_subnet_1" {
  vpc_id            = aws_vpc.kops_project_vpc.id
  cidr_block        = "10.0.1.0/24"
  
  # Setting this flag to true marks this subnet as a public subnet
  map_public_ip_on_launch = true
  availability_zone = var.provider_az[0]

  tags = {
    Name = "${local.resource_name}-public-subnet-1"
  }
}

resource "aws_subnet" "kops_project_private_subnet_1" {
  vpc_id            = aws_vpc.kops_project_vpc.id
  cidr_block        = "10.0.2.0/24"
  
  availability_zone = var.provider_az[1]

  tags = {
    Name = "${local.resource_name}-private-subnet-1"
  }
}
