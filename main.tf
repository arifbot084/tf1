 provider "aws" {    
  region = "us-east-1"
  
}

resource "aws_instance" "test_instance" {
 ami           = "ami-0c101f26f147fa7fd"
 instance_type = var.instance_type
 tags = {
   Name = "test_instance"
 }
}
variable "instance_type" {
    default = "t2.micro"
}
