
data "aws_ami" "os_image" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*amd64*"]
  }
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-tf-key"
  public_key = file("my-tf-key.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "My Z plus security"
  description = "this is security group created by tf"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  for_each = local.instances
  ami                    = data.aws_ami.os_image.id
  instance_type          = var.aws_instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  root_block_device {
    volume_size = var.aws_root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.value
  }
}
