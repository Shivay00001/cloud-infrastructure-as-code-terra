resource "aws_security_group" "web" {
  name        = "${var.environment}-web-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
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

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (varies by region)
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
