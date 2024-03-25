 provider "aws" {    
  region = "us-east-1"
  
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
  
}
resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.10.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mysubnet"
  }
  
}
resource "aws_subnet" "mysubnet2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.10.20.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mysubnet"
  }
  
}



resource "aws_dynamodb_table" "example" {
  name           = "example-table"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "N"
  }

  tags = {
    Environment = "production"
    Name        = "example-table"
  }
}
