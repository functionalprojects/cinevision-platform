provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
  environment = "dev"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
  common_tags = var.common_tags
}

module "eks" {
  source = "../../modules/eks"
  environment = "dev"
  private_subnet_ids = module.vpc.private_subnet_ids
  desired_size = var.eks_desired_size
  node_group_subnet_ids = module.vpc.public_subnet_ids
  max_size = var.eks_max_size
  min_size = var.eks_min_size
  instance_types = var.eks_instance_types
  common_tags = var.common_tags
}

module "rds" {
  source = "../../modules/rds"
  environment = "dev"
  instance_class = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  multi_az = false
  db_name = var.rds_db_name
  db_username = var.rds_db_username
  db_password = var.rds_db_password
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  backup_retention_period = 7
  skip_final_snapshot = true
  common_tags = var.common_tags
}

module "redis" {
  source = "../../modules/redis"
  environment = "dev"
  subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id
  node_type = var.redis_node_type
  common_tags = var.common_tags
}

module "msk" {
  source = "../../modules/msk"
  environment = "dev"
  subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id 
  number_of_broker_nodes = 2
  broker_instance_type = var.msk_broker_instance_type
  common_tags = var.common_tags
}