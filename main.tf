provider "aws" {
  region = var.region
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source             = "./modules/compute"
  vpc_id             = module.networking.vpc_id
  subnet_ids         = module.networking.subnet_ids
  instance_type      = var.instance_type
  security_group_ids = [module.networking.security_group_id]
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
}

module "iam" {
  source     = "./modules/iam"
  iam_policy = var.iam_policy
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "bucket_arn" {
  value = module.storage.bucket_arn
}
