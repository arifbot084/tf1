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