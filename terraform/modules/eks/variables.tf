variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
}

variable "instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "node_group_subnet_ids" {
  description = "Subnet IDs for the node group (defaults to private_subnet_ids)"
  type        = list(string)
  default     = null
} 