provider "aws" {
  
  region  = var.region
  
}

# Backend s3
terraform {
  backend "s3" {
    bucket = "poc-terra-backend"
    key    = "tfstate/poc"
    region = "us-east-1"
  }
}