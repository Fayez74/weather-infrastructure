provider "aws" {
  region = "eu-west-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

resource "aws_eks_cluster" "eks-cluster" {
    name        = "eks-cluster-weather"
    role_arn    = aws_iam_role.cluster_role.arn
    
    vpc_config  {
        subnet_ids = ["subnet-0957e4e5073ea8b67","subnet-096c4cd02a4d40752"]
    }
}

resource "aws_eks_node_group" "eks-node-group" {
    cluster_name    = "eks-cluster-weather"
    node_group_name = "eks-node-group"
    node_role_arn   = aws_iam_role.eks_node_group_role.arn
    subnet_ids      = ["subnet-0957e4e5073ea8b67","subnet-096c4cd02a4d40752"]

    scaling_config {
        desired_size    = 2
        max_size        = 3
        min_size        = 2
        
    }
    remote_access {
       ec2_ssh_key = "sandbox-key"
    }
   capacity_type = "SPOT"
   instance_types = ["t2.micro"]
  
}