data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "my-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.project_name}-${var.environment}"
  cluster_version = "1.17"
  subnets         = data.terraform_remote_state.vpc.outputs.private_subnets
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id
  node_groups = [
    {
	name = "nodes1",
	iam_role_arn = aws_iam_role.nodes.arn
        max_capacity = 5
        min_capacity = 1
        desired_capacity = 2
	instance_types = ["t3.large"]
    }
  ]

}
