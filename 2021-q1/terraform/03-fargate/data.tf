data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../01-vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "eks" {
  backend = "local"

  config = {
    path = "../02-cluster/terraform.tfstate"
  }
}
