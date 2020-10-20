terraform {
  backend "http" {
  }
}

provider "aws" {
  region = "eu-west-2"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

#################
# Security group 
#################

resource "aws_security_group" "db_instance" {
  name   = var.name
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "allow_db_access" {
  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.db_instance.id
  cidr_blocks       = ["0.0.0.0/0"]
}

############
# Database
############

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "production-db-pg"

  engine              = "postgres"
  engine_version      = "11.6"
  instance_class      = "db.t2.micro"

  name                = var.name
  username            = var.username
  port                = var.port
  password            = var.password
  allocated_storage   = var.allocated_storage

  subnet_ids             = data.aws_subnet_ids.all.ids
  vpc_security_group_ids = [aws_security_group.db_instance.id]

  maintenance_window  = "Mon:00:00-Mon:03:00"
  backup_window       = "03:00-06:00"

  apply_immediately   = true
  publicly_accessible = true

  family = "postgres11"
  major_engine_version = "11"

  tags = {
    Terraform = "true"
  }
}
