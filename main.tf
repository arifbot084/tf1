 provider "aws" {    
  region = "us-east-1"
  
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
  
}
data "aws_availability_zones" "available" {}

variable "Private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the Private subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

resource "aws_subnet" "Private_subnets" {
  count                   = length(var.Private_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.Private_subnet_cidr_blocks[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  

  tags = {
    Name = "Private_subnet_${count.index}"
  }
}


