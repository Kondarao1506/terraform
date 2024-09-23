resource "aws_security_group" "allow_ssh_terraform"{
    name = var.sg_name
    description = var.sg_desc

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.port
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks #allowing for everyone
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = {
       Name = "allow_sshH"
  }
}

resource "aws_instance" "terraform"{
  count = length(var.instances)
  ami = var.ami_id
  instance_type = var.envi == "prod" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = var.instances[count.index]
  }
}