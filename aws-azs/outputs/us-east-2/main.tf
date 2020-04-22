module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-07c1207a9d40bc3bd"
  region = "us-east-2"
}

output "public_ips" {
  value = module.latency-test.public_ips
}

output "private_ips" {
  value = module.latency-test.private_ips
}

output "private_dns" {
  value = module.latency-test.private_dns
}
