variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

# EKS
variable "eks_desired_size" {
  description = "Desired number of EKS worker nodes"
  type        = number
}
variable "eks_max_size" {
  description = "Maximum number of EKS worker nodes"
  type        = number
}
variable "eks_min_size" {
  description = "Minimum number of EKS worker nodes"
  type        = number
}
variable "eks_instance_types" {
  description = "Instance types for EKS worker nodes"
  type        = list(string)
}

# RDS
variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
}
variable "rds_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}
variable "rds_db_name" {
  description = "Database name"
  type        = string
}
variable "rds_db_username" {
  description = "Database username"
  type        = string
}
variable "rds_db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

# Redis
variable "redis_node_type" {
  description = "Redis node type"
  type        = string
}
variable "redis_num_nodes" {
  description = "Number of Redis cache nodes (for cluster mode)"
  type        = number
}

# MSK
variable "msk_broker_instance_type" {
  description = "Instance type for MSK brokers"
  type        = string
}