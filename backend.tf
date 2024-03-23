terraform {
backend "s3" {
    bucket         = "tfback024"
    key            = "terraform.tfstate"
    region         = "us-east-1"
}
}