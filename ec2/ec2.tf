resource "aws_instance" "test" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = "test"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow-all" {
  name = "allow-all"
  description = "Allow all inbound traffic"

  egress {
    from_port = 0 # All ports from outbound
    to_port = 0 # All ports to outbound
    protocol = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"] # All IPs
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
      Name = "allow-all"
      Terraform = "true"
    }
}