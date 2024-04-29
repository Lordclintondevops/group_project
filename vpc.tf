# Creating a VPC
resource "aws_vpc" "group_demo" {
    cidr_block = var.cidr
    instance_tenancy = "default"
}

# Creating an Internet Gateway
resource "aws_internet_gateway" "group_ig" {
    vpc_id = aws_vpc.group_demo.id
  
}