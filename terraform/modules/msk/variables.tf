variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for brokers"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the MSK cluster will be placed"
  type        = string
}

variable "kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "3.6.0"
}

variable "number_of_broker_nodes" {
  description = "Number of broker nodes"
  type        = number
  default     = 1
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
  description = "Common tags to apply to all resources"
  type        = map(string)
}