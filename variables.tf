variable "region" {
    type = string
    default = "us-east-1"
  
}

variable "cidr" {
    type = string
    default = "10.1.0.0/16"
  
}

variable "cidr_pub" {
    type = string
    default = "10.1.0.0/24"
  
}

variable "cidr_priv" {
  type = string
  default = "10.1.1.0/24"
}

variable "pub_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "ec2_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_count" {
    type = number
    default = 2
  
}