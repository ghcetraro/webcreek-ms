#
data helm_repository alb_controller_ingress {
    url      = "https://aws.github.io/eks-charts"
    name     = "aws-load-balancer-controller"
}
#
resource helm_release aws-load-balancer-controller {
    name     = "aws-load-balancer-controller"
    repository = data.helm_repository.alb_controller_ingress.metadata[0].name
    #repository = "https://aws.github.io/eks-charts"
    chart      = "aws-load-balancer-controller/aws-load-balancer-controller"
    namespace           = "kube-system"
    #version = "1.4.1"
    version = "1.4.5"
    create_namespace = false
    timeout             = 600
    reuse_values        = false
    dependency_update   = true
    force_update        = true
    recreate_pods       = true
    wait                = true
    max_history         = 10
    
    set {
        name  = "clusterName"
        value = local.cluster_name
    }
    set {
        name  = "serviceAccount.create"
        value = "true"
    }
    set {
        name  = "serviceAccount.name"
        value = "aws-load-balancer-controller"
    }
    set {
        name  = "clusterName"
        value = local.cluster_name
    }
    depends_on = [
        module.vpc,
        module.eks
    ]
}