module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-077d5d3682940b34a"
  region = "sa-east-1"
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
