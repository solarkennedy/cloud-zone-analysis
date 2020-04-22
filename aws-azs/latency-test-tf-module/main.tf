provider "aws" {
  region = var.region
}

resource "aws_vpc" "latency-test-vpc" {
    cidr_block = "10.1.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "region-latency-test-vpc"
    }
}

resource "aws_internet_gateway" "latency-test-gw" {
    vpc_id = aws_vpc.latency-test-vpc.id
    tags = {
        Name = "latency-test-igw"
    }
}

resource "aws_route_table" "latency-test-crt" {
    vpc_id = aws_vpc.latency-test-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.latency-test-gw.id
    }
    tags = {
        Name = "latency-test-crt"
    }
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = aws_vpc.latency-test-vpc.id
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
    tags = {
        Name = "ssh-allowed"
    }
}

resource "aws_key_pair" "ssh-key-pair" {
    key_name = "ssh-key-pair"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA5OUhoBfllvee/ywZ85RIiYAwATPLnWW+h5nCaKzX9WEIJWXcToZ4XroaSUjukWcuzezY5TeMEr2WheKuONivqsMtc4zPQPRdcOMOeOgXCAbNHBj97g7Ee8kb9u9TmgNVT8SaJm9pVIkM9+uMe+tXwhTcQHkrMTG9M3T0hBb4YxttPv5kVPgDfAHGB3On/wcVcgtQlDrI6DGVwRlRBVvBR4DjlF7qv8/9Zi2KVMGSJyI2urmT+WGTN6liteji+U840PIKDscVoY8KCLFq6g5VB9NZZwbbbRrXD5cpoE3ToX9U7kaJZvj3BzfYffRJNfm62bILeWWlRwh7EMYW2Sgj"
}
