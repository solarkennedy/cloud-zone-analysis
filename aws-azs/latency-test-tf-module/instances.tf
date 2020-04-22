data "aws_availability_zones" "all" {}

resource "aws_instance" "instances" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = aws_subnet.latency-test-subnet[count.index].id
  key_name = aws_key_pair.ssh-key-pair.id
  associate_public_ip_address = true

  count             = length(data.aws_availability_zones.all.names)
  availability_zone = data.aws_availability_zones.all.names[count.index]
}

output "public_ips" {
  value = aws_instance.instances[*].public_ip
}

output "private_ips" {
  value = aws_instance.instances[*].private_ip
}

output "private_dns" {
  value = aws_instance.instances[*].private_dns
}
