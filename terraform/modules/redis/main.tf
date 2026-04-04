resource "aws_security_group" "redis" {
  name   = "cinevision-redis-${var.environment}"
  vpc_id = var.vpc_id
  ingress {
    from_port = 6379
    to_port   = 6379
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
    Name = "cinevision-redis-${var.environment}"
  })
}

resource "aws_elasticache_subnet_group" "main" {
  name       = "cinevision-${var.environment}"
  subnet_ids = var.subnet_ids
  tags       = var.common_tags
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "cinevision-${var.environment}"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  security_group_ids   = [aws_security_group.redis.id]
  tags = merge(var.common_tags, {
    Name = "cinevision-${var.environment}"
  })
}