module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-08c757228751c5335"
  region = "eu-west-3"
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
