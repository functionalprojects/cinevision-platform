variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs (must be same length as number_of_broker_nodes for 1:1 mapping, but MSK handles distribution)"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "3.6.0"
}

variable "number_of_broker_nodes" {
  description = "Number of broker nodes. Must be a multiple of the number of AZs used (here 3 AZs, so set to 3 or 6)"
  type        = number
  default     = 3
}

variable "broker_instance_type" {
  description = "Instance type for brokers"
  type        = string
  default     = "kafka.t3.small"
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 100
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}