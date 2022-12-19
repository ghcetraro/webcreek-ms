#
resource "helm_release" "cluster_autoscaler" {
    name              = "cluster-autoscaler"
    repository        = "https://kubernetes.github.io/autoscaler"
    chart             = "cluster-autoscaler"
    version           = "9.16.2"
    create_namespace  = false
    namespace         = "kube-system"
    timeout           = 600
    reuse_values      = false
    dependency_update = true
    force_update      = true
    recreate_pods     = true
    wait              = true
    max_history       = 10
    set {
        name  = "autoDiscovery.clusterName"
        value = local.cluster_name
    }
    set {
        name  = "autoDiscovery.cloudProvider"
        value = "aws"
    }
    set {
        name  = "awsRegion"
        value = var.region
    }
    set {
        name  = "replicaCount"
        value = 1
    }
    depends_on = [
        module.vpc,
        module.eks
    ]
}