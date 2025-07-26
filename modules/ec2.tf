resource "aws_key_pair" "my_key"{
  key_name = "${var.ec2_key_name}-${var.env}"
  public_key = file("terraform-key.pub")

  tags = {
    Environment = "${var.env}"
  }
} 

resource "aws_default_vpc" "my_vpc" {
  
}

resource "aws_security_group" "my_security_group" {
  name = "${var.ec2_security_group}-${var.env}"
  vpc_id = aws_default_vpc.my_vpc.id

  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  tags = {
    Environment = "${var.env}"
  }
}

resource "aws_instance" "my_instance" {
  key_name = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type = var.ec2_instance_type
  ami = var.ec2_ami
  

    root_block_device{
        volume_size = "${var.ec2_volume_size}"
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.ec2_instance_name}-${var.env}"
        Environment = "${var.env}"
    }
}
