module "vpc" {
  source = "../modules/terraform-aws-vpc"

  name = "MyVpc"
  cidr = "172.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  public_subnets  = ["172.0.1.0/24","172.0.2.0/24"]
  

  create_igw = true
  enable_dns_hostnames = true
  enable_nat_gateway = true

  tags = {
    Terraform = "true"
  }
}