    module "eks_fargate" {
      source  = "terraform-module/eks-fargate-profile/aws"
      version = "2.2.0"
      cluster_name    = "${var.project_name}-${var.environment}"
      subnet_ids           = data.terraform_remote_state.vpc.outputs.private_subnets
      namespaces           = ["monitoring"]
       
    }
