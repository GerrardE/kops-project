# -----------------------------------------------------------------------------
# Resource: EC2 Key Pair
# -----------------------------------------------------------------------------
resource "aws_key_pair" "kops_project_keypair" {
  key_name   = "kops_project_keypair"
  public_key = file(var.public_key)
}

# -----------------------------------------------------------------------------
# Resource: EC2
# -----------------------------------------------------------------------------
resource "aws_instance" "kops_project_ec2" {
  ami           = data.aws_ami.kops_project_ami.id
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.kops_project_public_subnet_1.id

  # Security Group
  vpc_security_group_ids = [aws_security_group.kops_project_security_group.id]

  # Public ssh key for accessing the ec2
  key_name = aws_key_pair.kops_project_keypair.id

  connection {
      user = var.ec2_user
      private_key = file(var.private_key)
  }

  # network_interface {
  #   network_interface_id = aws_network_interface.kops_project_network_interface.id
  #   device_index         = 0
  # }

  # credit_specification {
  #   cpu_credits = "unlimited"
  # }

  tags = {
    Name = "${local.resource_name}-ec2"
  }
}
