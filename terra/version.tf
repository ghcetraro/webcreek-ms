#
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "4.15.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "3.1.0"
        }
        kubectl = {
            source  = "gavinbunney/kubectl"
            version = ">=1.7.0"
        }
        helm = {
            source  = "hashicorp/helm"
            version = "1.3.2"
        }
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "~> 2.12.1"
        }
    }
    required_version = ">= 1.0.0"
}
#