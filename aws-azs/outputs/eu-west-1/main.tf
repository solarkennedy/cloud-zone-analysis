module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0701e7be9b2a77600"
  region = "eu-west-1"
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
