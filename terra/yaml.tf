#
data "kubectl_path_documents" "docs_services" {
    pattern = "./manifests/*.yaml"
}
#
resource "kubectl_manifest" "docs_services" {
    for_each  = toset(data.kubectl_path_documents.docs_services.documents)
    yaml_body = each.value
    depends_on = [
        module.vpc,
        module.eks,
    ]
}
#