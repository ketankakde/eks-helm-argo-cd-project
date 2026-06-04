module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"

  vpc_id = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"

  subnet_ids        = [module.vpc.public_subnet_id]
  security_group_id = module.sg.sg_id
}

module "cw" {
  source = "./modules/cw"
}
