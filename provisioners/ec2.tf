resource "aws_instance" "terraform" {
	count = 2
	ami = "ami-09c813fb71547fc4f"
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.allow_all.id]
	tags = {
		Name = "terraform"
		Terraform = "true"
	}
	provisioner "local-exec" {
		command = "echo Instance has been created"
	}

	provisioner "local-exec" {
		command = "echo ${self.private_ip} >> inventory.ini"
	}
	provisioner "local-exec" {
     		command = "echo Instance is destroyed"
      		when    = destroy
	}
	# connection {
	# 	type = "ssh"
	# 	user = "ec2-user"
	# 	password = "DevOps321"
	# 	host = self.public_ip
	# }
	# provisioner "remote-exec" {
	# 	inline = [
	# 		"sudo dnf update -y",
	# 		"sudo dnf install nginx -y",
	# 		"sudo systemctl start nginx"
	# 	]
	# }

	# provisioner "remote-exec" {
	# 	inline = [
	# 		"sudo systemctl stop nginx",
	# 		"echo 'Successfully stopped nginx' "
	# 	]
	# }
}

resource "aws_security_group" "allow_all" {
	name = "allow-all"

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "allow-all"
	}
}
