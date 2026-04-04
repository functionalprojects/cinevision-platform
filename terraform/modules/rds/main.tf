resource "aws_db_subnet_group" "main" {
  name       = "cinevision-${var.environment}"
  subnet_ids = var.subnet_ids
  tags       = var.common_tags
}

resource "aws_security_group" "rds" {
  name   = "cinevision-rds-${var.environment}"
  vpc_id = var.vpc_id
  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # In production, restrict to VPC CIDR
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.common_tags, {
    Name = "cinevision-rds-${var.environment}"
  })
}

resource "aws_db_instance" "main" {
  identifier     = "cinevision-${var.environment}"
  engine         = "postgres"
  engine_version = "15"
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  storage_encrypted = true
  db_name        = var.db_name
  username       = var.db_username
  password       = var.db_password
  multi_az       = var.multi_az
  publicly_accessible = false
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.main.name
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot = var.skip_final_snapshot
  tags = merge(var.common_tags, {
    Name = "cinevision-${var.environment}"
  })
}