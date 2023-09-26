terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

#Provider profile and region in which all the resources will create
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "prometheus" {
  ami           = "ami-0ccea833bf267252a"
  instance_type = "t2.small"
  count         = "1"
  key_name      = "monitoring"
  tags = {
    Name = "prometheus"
  }

    root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

resource "aws_instance" "grafana" {
  ami           = "ami-0ccea833bf267252a"
  instance_type = "t2.small"
  count         = "1"
  key_name      = "monitoring"
  tags = {
    Name = "grafana"
  }

    root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    delete_on_termination = true
  }
}
