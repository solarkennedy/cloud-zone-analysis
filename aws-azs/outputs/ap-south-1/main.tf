module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0b44050b2d893d5f7"
  region = "ap-south-1"
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
