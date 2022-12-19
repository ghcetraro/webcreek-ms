#
data helm_repository external_dns {
    url      = "https://charts.bitnami.com/bitnami"
    name     = "external-dns"
}
#
resource helm_release external_dns {
    name     = "external-dns"
    repository = data.helm_repository.external_dns.metadata[0].name
    chart      = "external-dns"
    namespace           = "kube-system"
    version = "6.11.3"
    create_namespace = false
    timeout             = 600
    reuse_values        = false
    dependency_update   = true
    force_update        = true
    recreate_pods       = true
    wait                = true
    max_history         = 10
    
    set {
        name  = "provider"
        value = "aws"
    }
    depends_on = [
        module.vpc,
        module.eks,
        resource.aws_iam_policy.external-dns
    ]
}