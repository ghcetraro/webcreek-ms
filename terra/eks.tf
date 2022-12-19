#
module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "18.26.6"
    #
    cluster_name    = local.cluster_name
    cluster_version = "1.22"
    cluster_endpoint_private_access = true
    cluster_endpoint_public_access  = true
    cluster_additional_security_group_ids = [aws_security_group.eks.id]
    #
    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    #
    eks_managed_node_group_defaults = {
        ami_type               = "AL2_x86_64"
        disk_size              = 50
        instance_types         = ["t3.medium", "t3.large"]
        vpc_security_group_ids = [aws_security_group.eks.id]
    }
    
    eks_managed_node_groups = {
        one = {
            name = "${var.namespace}-${var.project}-1"
            
            min_size     = 5
            desired_size = 5
            max_size     = 8
            
            instance_types = ["t3.xlarge"]
            
            tags = {
                "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
                "k8s.io/cluster-autoscaler/enabled"               = true
            }
        }
    }
    #
    depends_on = [
        module.vpc,
        aws_security_group.eks
    ]
}
