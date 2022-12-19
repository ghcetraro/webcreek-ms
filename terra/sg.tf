#
resource "aws_security_group" "eks" {
    name        = "${var.namespace}-${var.project}-eks"
    description = "Allow traffic"
    vpc_id      = module.vpc.vpc_id
    
    ingress {
        description      = "World"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        "Name" = "${local.cluster_name}"
        #"kubernetes.io/cluster/${local.cluster_name}" = "owned"
    }
    depends_on = [
        module.vpc
    ]
}
