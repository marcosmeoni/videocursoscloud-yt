module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  intra_subnets   = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]

  enable_nat_gateway = true

  private_subnet_tags = {
   "kubernetes.io/role/internal-elb" = "1",
   "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "shared"
  }

  public_subnet_tags = {
   "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "shared"
   "kubernetes.io/role/elb" = "1"
  }
  
  tags = {
    Terraform = "true"
    Environment = var.environment
    project_name = var.project_name
  }
}
