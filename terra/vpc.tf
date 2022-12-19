#
module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.14.2"
    
    name = "${var.namespace}-${var.project}-eks"
    
    cidr = var.vpc_cidr
    azs  = slice(data.aws_availability_zones.available.names, 0, 2)
    
    private_subnets = ["10.250.1.0/24", "10.250.2.0/24"]
    public_subnets  = ["10.250.3.0/24", "10.250.4.0/24"]
    
    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true
    
    public_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "owned"
        "kubernetes.io/role/elb"                      = 1
    }
    
    private_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "owned"
        "kubernetes.io/role/internal-elb"             = 1
    }
}
