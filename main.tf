 provider "aws" {    
  region = "us-east-1"
  
}
/*
resource "aws_instance" "test_instance" {
 ami           = "ami-0c101f26f147fa7fd"
 instance_type = "t2.micro"
 tags = {
   Name = "test1_instance"
 }
}
*/
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "my_vpc"
  }
  
}
