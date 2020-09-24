provider "aws" {
  region = "eu-west-2"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "db" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 2.0"

  name                            = "production-aurora-postgresql"
  engine                          = "aurora-postgresql"
  engine_version                  = "11.6"

  vpc_id                          = data.aws_vpc.default.id
  subnets                         = data.aws_subnet_ids.all.ids

  replica_count                   = 1
  allowed_cidr_blocks             = ["0.0.0.0/0"]
  instance_type                   = "db.r4.large"
  apply_immediately               = true
  publicly_accessible             = true
  username                        = "postgres"

  tags                            = {
    Environment = "dev"
    Terraform   = "true"
  }
}
