module "vpc" {
  source = "./modules/vpc"

  cidr_block = var.cidr_block

  pub_1_cidr = var.pub_1_cidr
  pub_2_cidr = var.pub_2_cidr

  pri_1_cidr = var.pri_1_cidr
  pri_2_cidr = var.pri_2_cidr

  az_1 = var.az_1
  az_2 = var.az_2
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "my-eks"

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  private_subnet_ids = [
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]

  cluster_policy_attachment = module.iam.cluster_role_arn

}
