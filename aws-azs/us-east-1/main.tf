provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "latency-test-vpc" {
    cidr_block = "10.1.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags {
        Name = "region-latency-test-vpc"
    }
}

resource "aws_internet_gateway" "latency-test-gw" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    tags {
        Name = "latency-test-igw"
    }
}

resource "aws_route_table" "latency-test-crt" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.latency-test-gw.id}"
    }
    tags {
        Name = "latency-test-crt"
    }
}


resource "aws_subnet" "latency-test-subnet-1a" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags {
        Name = "latency-test-subnet-1a"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1a"{
    subnet_id = "${aws_subnet.latency-test-subnet-1a.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_subnet" "latency-test-subnet-1b" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"
    tags {
        Name = "latency-test-subnet-1b"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1b"{
    subnet_id = "${aws_subnet.latency-test-subnet-1b.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_subnet" "latency-test-subnet-1c" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1c"
    tags {
        Name = "latency-test-subnet-1c"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1c"{
    subnet_id = "${aws_subnet.latency-test-subnet-1c.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_subnet" "latency-test-subnet-1d" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.4.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1d"
    tags {
        Name = "latency-test-subnet-1d"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1d"{
    subnet_id = "${aws_subnet.latency-test-subnet-1d.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_subnet" "latency-test-subnet-1e" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.5.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1e"
    tags {
        Name = "latency-test-subnet-1e"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1e"{
    subnet_id = "${aws_subnet.latency-test-subnet-1e.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_subnet" "latency-test-subnet-1f" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    cidr_block = "10.1.6.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1f"
    tags {
        Name = "latency-test-subnet-1f"
    }
}
resource "aws_route_table_association" "latency-test-crta-latency-test-subnet-1f"{
    subnet_id = "${aws_subnet.latency-test-subnet-1f.id}"
    route_table_id = "${aws_route_table.latency-test-crt.id}"
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = "${aws_vpc.latency-test-vpc.id}"
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }  
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress { 
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "ssh-allowed"
    }
}

resource "aws_key_pair" "ssh-key-pair" {
    key_name = "ssh-key-pair"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA5OUhoBfllvee/ywZ85RIiYAwATPLnWW+h5nCaKzX9WEIJWXcToZ4XroaSUjukWcuzezY5TeMEr2WheKuONivqsMtc4zPQPRdcOMOeOgXCAbNHBj97g7Ee8kb9u9TmgNVT8SaJm9pVIkM9+uMe+tXwhTcQHkrMTG9M3T0hBb4YxttPv5kVPgDfAHGB3On/wcVcgtQlDrI6DGVwRlRBVvBR4DjlF7qv8/9Zi2KVMGSJyI2urmT+WGTN6liteji+U840PIKDscVoY8KCLFq6g5VB9NZZwbbbRrXD5cpoE3ToX9U7kaJZvj3BzfYffRJNfm62bILeWWlRwh7EMYW2Sgj"
}
