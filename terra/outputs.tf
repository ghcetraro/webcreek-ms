output "region" {
    description = "AWS region"
    value       = var.region
}
#
output "vpc_id" {
    description = "id of vpc"
    value = module.vpc.vpc_id
}
#
output "vpc_subnet_id" {
    description = "id of subnet vpc"
    value = module.vpc.private_subnets[0]
}
#####################################
##
output "cluster_id" {
    description = "EKS cluster ID"
    value       = module.eks.cluster_id
}
#
output "cluster_endpoint" {
    description = "Endpoint for EKS control plane"
    value       = module.eks.cluster_endpoint
}
#
output "cluster_security_group_id" {
    description = "Security group ids attached to the cluster control plane"
    value       = module.eks.cluster_security_group_id
}
#
output "cluster_name" {
    description = "Kubernetes Cluster Name"
    value       = local.cluster_name
}
#
output "cluster_ca" {
    description = "Kubernetes Ca"
    value = module.eks.cluster_certificate_authority_data
}
#
output "cluster_oidc_issuer_url" {
    value = module.eks.cluster_oidc_issuer_url
}
#
output "cluster_self_managed_node_groups" {
    value = module.eks.self_managed_node_groups
}
#
output "cluster_managed_node_groups" {
    value = module.eks.eks_managed_node_groups
}
#
output "cluster_node_security_group_id" {
    value = module.eks.node_security_group_id
}
