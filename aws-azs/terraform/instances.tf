

resource "aws_instance" "us-east-1a" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1a.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}
resource "aws_instance" "us-east-1b" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1b.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}
resource "aws_instance" "us-east-1c" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1c.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}
resource "aws_instance" "us-east-1d" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1d.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}
resource "aws_instance" "us-east-1e" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1e.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}
resource "aws_instance" "us-east-1f" {
  ami = "ami-085925f297f89fce1" 
  instance_type = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1f.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
  associate_public_ip_address = true
}

output "public_ips" {
  value = [
    "${aws_instance.us-east-1a.public_ip}",
    "${aws_instance.us-east-1b.public_ip}",
    "${aws_instance.us-east-1c.public_ip}",
    "${aws_instance.us-east-1d.public_ip}",
    "${aws_instance.us-east-1e.public_ip}",
    "${aws_instance.us-east-1f.public_ip}",
  ]
}

output "private_ips" {
  value = [
    "${aws_instance.us-east-1a.private_ip}",
    "${aws_instance.us-east-1b.private_ip}",
    "${aws_instance.us-east-1c.private_ip}",
    "${aws_instance.us-east-1d.private_ip}",
    "${aws_instance.us-east-1e.private_ip}",
    "${aws_instance.us-east-1f.private_ip}",
  ]
}

output "private_dns" {
  value = [
    "${aws_instance.us-east-1a.private_dns}",
    "${aws_instance.us-east-1b.private_dns}",
    "${aws_instance.us-east-1c.private_dns}",
    "${aws_instance.us-east-1d.private_dns}",
    "${aws_instance.us-east-1e.private_dns}",
    "${aws_instance.us-east-1f.private_dns}",
  ]
}
