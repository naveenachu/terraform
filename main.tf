
provider "aws" {
    region = "us-east-1"
    profile = "achu"
  }
 
 variable "vpc_cidr_block" {
   description = "vpc cidr block"
 }
 
 
 variable "subnet_cidr_block" {
   description = "subnet cidr block"
 }

 variable "environment" {
   description = "deployment"
 }

  
  resource "aws_vpc" "development-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      Name = var.environment
    }
  }
  resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-1a"
    tags = {
      Name = var.environment
    }
  }