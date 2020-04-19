

resource "aws_instance" "us-east-1a" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1a.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
resource "aws_instance" "us-east-1b" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1b.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
resource "aws_instance" "us-east-1c" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1c.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
resource "aws_instance" "us-east-1d" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1d.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
resource "aws_instance" "us-east-1e" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1e.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
resource "aws_instance" "us-east-1f" {
  ami = "ami-0a95885959e5a200b" 
  instance_type = "t3a.nano"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"] 
  subnet_id = "${aws_subnet.latency-test-subnet-1f.id}"
  key_name = "${aws_key_pair.ssh-key-pair.id}"
}
