data "aws_instance" "instance" {
    instance_id = "i-0d7fed8943c3e5688"
}

output "instance_ip_addresses" {
    value = data.aws_instance.instance.private_ip
}

output "instance_name_status" {
    value = data.aws_instance.instance.instance_state
}
