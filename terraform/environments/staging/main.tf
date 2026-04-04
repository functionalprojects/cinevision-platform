

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
  environment = "staging"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs = var.azs
  enable_nat_gateway = true   # Required for private subnets to reach internet
  common_tags = var.common_tags
}

module "eks" {
  source = "../../modules/eks"
  environment = "staging"
  private_subnet_ids = module.vpc.private_subnet_ids
  desired_size = var.eks_desired_size
  max_size = var.eks_max_size
  min_size = var.eks_min_size
  instance_types = var.eks_instance_types
  common_tags = var.common_tags
}

module "rds" {
  source = "../../modules/rds"
  environment = "staging"
  instance_class = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  multi_az = true
  db_name = var.rds_db_name
  db_username = var.rds_db_username
  db_password = var.rds_db_password
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  backup_retention_period = 14
  skip_final_snapshot = false
  common_tags = var.common_tags
}

module "redis" {
  source = "../../modules/redis"
  environment = "staging"
  subnet_ids = module.vpc.private_subnet_ids
  vpc_id = module.vpc.vpc_id
  node_type = var.redis_node_type
  common_tags = var.common_tags
}

module "msk" {
  source = "../../modules/msk"
  environment = "staging"
  subnet_ids = module.vpc.private_subnet_ids   # All 3 private subnets (one per AZ)
  vpc_id = module.vpc.vpc_id
  number_of_broker_nodes = 3   # Must be multiple of number of AZs (3)
  broker_instance_type = var.msk_broker_instance_type
  common_tags = var.common_tags
}