resource "aws_security_group" "msk" {
  name   = "cinevision-msk-${var.environment}"
  vpc_id = var.vpc_id
  ingress {
    from_port = 9092
    to_port   = 9092
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.common_tags, {
    Name = "cinevision-msk-${var.environment}"
  })
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = "cinevision-${var.environment}"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type   = var.broker_instance_type
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.msk.id]
    storage_info {
      ebs_storage_info {
        volume_size = var.ebs_volume_size
      }
    }
  }

  tags = merge(var.common_tags, {
    Name = "cinevision-${var.environment}"
  })
}