# Creating A EC2 Instance
resource "aws_instance" "group_ec2" {
    ami = data.aws_ami.ami1.id
    instance_type = var.ec2_type
    key_name = "clintontest"
    subnet_id = aws_subnet.group_pub.id
    security_groups = [aws_security_group.group_sg.id]

    user_data = <<EOF
    sudo hostnamectl set-hostname jenkins
    EOF
  
}

# Creating the secound EC2 instance
resource "aws_instance" "group_ec21" {
    ami = data.aws_ami.ami1.id
    instance_type = var.ec2_type
    key_name = "clintontest"
    subnet_id = aws_subnet.group_pub.id
    security_groups = [aws_security_group.group_sg.id]

    count = var.ec2_count

    user_data = <<EOF
    sudo hostnamectl set-hostname QA
    sudo apt-get update
    sudo install tomcat9
    sudo apt-get update
    sudo install tomcat-admin
    EOF
  
}

data "aws_ami" "ami1" {
    most_recent = true
  
}

