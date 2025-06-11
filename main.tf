module "vpc" {
  source = "./modules/vpc"
  region_name = var.region_name
  env_name = var.env_name
  vpc_cidr = var.vpc_cidr
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
}

module "instance" {
  source        = "./modules/instance"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id_pb
  instance_type = var.instance_type
  env_name      = var.env_name
  ami_id        = var.ami_id
}