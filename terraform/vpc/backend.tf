terraform {
  backend "s3" {
    bucket = "terraform-remote-state-k8"
    key = "terraform/vpc/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "remote-state-locking-table"
    encrypt = "true"
  }
}