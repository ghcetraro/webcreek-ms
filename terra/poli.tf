#
resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy" {
    name        = "${var.namespace}-${var.project}-AWSLoadBalancerControllerIAMPolicy"
    policy = file("policies/AWSLoadBalancerControllerIAMPolicy.json")
    #
}
#
resource "aws_iam_policy" "external-dns" {
    name        = "${var.namespace}-${var.project}-external-dns"
    policy = file("policies/external-dns.json")
    #
}