resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.vpc_name
  }
}

#public subnet
resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block =var.pub_sub_cidr_block
  availability_zone =var.pub_sub_az

  tags = {
    Name = var.pub_sub_name
  }
}


#internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.internet_gt_name
  }
}

#public route table
resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.pub_route_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.pub_route_name
  }
}

#associate public subnet with RT
resource "aws_route_table_association" "subnet-rt" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-rt.id
}


#generate key pair
resource "aws_key_pair" "key-pair" {
  key_name   = var.key_name
  public_key =var.public_key
}

#create security group

resource "aws_security_group" "security-grp" {
  name        = var.sec_grp_name
  description = var.sec_grp_des
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = var.sec_grp_tag_name
  }
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    from_port        = 9000
    to_port          = 9000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }    
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#create public EC2 instance
resource "aws_instance" "public-instance" {
  ami           = var.pub_ec2_ami
  instance_type = var.pub_ec2_ins_type
  key_name = var.pub_ec2_key_name
  vpc_security_group_ids = [ aws_security_group.security-grp.id ]
  subnet_id = aws_subnet.main-subnet.id
  associate_public_ip_address = var.pub_ec2_ass_ipaddr
  availability_zone = var.pub_ec2_az
  count=var.pub_ec2_count
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.pub_ec2_tag_name
  }
}

