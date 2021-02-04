data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../01-vpc/terraform.tfstate"
  }
}
