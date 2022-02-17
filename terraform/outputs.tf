output "region" {
  value = var.provider_region[0]
}

# -----------------------------------------------------------------------------
# Outputs: VPC
# -----------------------------------------------------------------------------
output "vpc_id" {
  value = aws_vpc.kops_project_vpc.id
}

output "vpc_name" {
  value = aws_vpc.kops_project_vpc.arn
}

output "vpc_cidr_block" {
  value = aws_vpc.kops_project_vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.kops_project_public_subnet_1.id
}

output "public_route_table_id" {
  value = aws_route_table.kops_project_route_table.id
}

output "private_subnet_id" {
  value = aws_subnet.kops_project_private_subnet_1.id
}

# output "private_route_table_id" {
#   value = aws_subnet.kops_project_private_subnet_1
# }

output "default_security_group_id" {
  value = aws_vpc.kops_project_vpc.default_security_group_id
}

# output "nat_gateway_ids" {
#   value = aws_.kops_project_vpc.nat_gateway_ids
# }

output "availability_zones" {
  value = var.provider_az
}

# output "common_http_sg_id" {
#   value = aws_security_group.k8s_common_http.id
# }

output "kops_project_s3_bucket" {
  value = aws_s3_bucket.kops_project_bucket.bucket
}

output "k8s_cluster_name" {
  value = local.k8s_cluster_name
}
