## agrego politica
resource "aws_iam_role_policy_attachment" "additional_a" {
    for_each = module.eks.eks_managed_node_groups
    
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    role       = each.value.iam_role_name
    depends_on = [
        module.eks
    ]
}
#
resource "aws_iam_role_policy_attachment" "additional_b" {
    for_each = module.eks.eks_managed_node_groups
    
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    role       = each.value.iam_role_name
    depends_on = [
        module.eks
    ]
}
#
resource "aws_iam_role_policy_attachment" "additional_c" {
    for_each = module.eks.eks_managed_node_groups
    
    policy_arn = aws_iam_policy.external-dns.arn
    role       = each.value.iam_role_name
    depends_on = [
        module.eks,
        resource.aws_iam_policy.external-dns
    ]
}
#
resource "aws_iam_role_policy_attachment" "additional_d" {
    for_each = module.eks.eks_managed_node_groups
    
    policy_arn = aws_iam_policy.AWSLoadBalancerControllerIAMPolicy.arn
    role       = each.value.iam_role_name
    depends_on = [
        module.eks,
        resource.aws_iam_policy.AWSLoadBalancerControllerIAMPolicy
    ]
}