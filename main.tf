# VPC

data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["MY-VPC"]
  }
}


# ALL SUBNETS

data "aws_subnets" "all_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }
}


# PUBLIC SUBNET

data "aws_subnet" "public_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["Public-Subnet"]
  }
}


# OUTPUTS

output "vpc_id" {
  value = data.aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  value = data.aws_vpc.my_vpc.cidr_block
}

output "all_subnet_ids" {
  value = data.aws_subnets.all_subnets.ids
}

output "public_subnet_id" {
  value = data.aws_subnet.public_subnet.id
}
