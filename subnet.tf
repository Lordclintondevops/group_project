# Creating Subnets Pub
resource "aws_subnet" "group_pub" {
    vpc_id = aws_vpc.group_demo.id
    cidr_block = var.cidr_pub
    map_public_ip_on_launch = true

    tags = {
      name = "group_pub"
    }
  
}

# Creating Subnet Priv
resource "aws_subnet" "group_priv" {
    vpc_id = aws_vpc.group_demo.id
    cidr_block = var.cidr_priv
  
    tags = {
      name = "group_priv"
    }
}

# Creating A Rout Table
resource "aws_route_table" "group_rt" {
    vpc_id = aws_vpc.group_demo.id

    route {
        cidr_block = var.pub_cidr
        gateway_id = aws_internet_gateway.group_ig.id
    }

    tags = {
      name = "group_rt"
    }
  
}

# Associating Our Subnet to the RT
resource "aws_route_table_association" "group_rta" {
    subnet_id = aws_subnet.group_pub.id
    route_table_id = aws_route_table.group_rt.id
  
}

