# -----------------------------------------------------------------------------
# Resource: Internet Gateway
# -----------------------------------------------------------------------------
resource "aws_internet_gateway" "kops_project_internet_gateway" {
  vpc_id = aws_vpc.kops_project_vpc.id

  tags = {
    Name = "${local.resource_name}-internet-gateway"
  }
}

# -----------------------------------------------------------------------------
# Resource: Custom Route table
# -----------------------------------------------------------------------------
resource "aws_route_table" "kops_project_route_table" {
  vpc_id = aws_vpc.kops_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.kops_project_internet_gateway.id
  }

  tags = {
    Name = "${local.resource_name}-route-table"
  }
}

# -----------------------------------------------------------------------------
# Resource: Route Table Association
# -----------------------------------------------------------------------------
resource "aws_route_table_association" "kops_project_route_table_association" {
  subnet_id      = aws_subnet.kops_project_public_subnet_1.id
  route_table_id = aws_route_table.kops_project_route_table.id
}

# -----------------------------------------------------------------------------
# Resource: Security Group
# -----------------------------------------------------------------------------
resource "aws_security_group" "kops_project_security_group" {
  name        = "allow_tls"
  description = "Allow traffic in kops_project"
  vpc_id      = aws_vpc.kops_project_vpc.id

  ingress {
    description      = "Allow ssh access on kops_project vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.kops_project_vpc.cidr_block]
  }

  ingress {
    description      = "Allow http access on kops_project vpc"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.kops_project_vpc.cidr_block]
  }

  ingress {
    description      = "Allow https access on kops_project vpc"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.kops_project_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.resource_name}-sg"
  }
}
