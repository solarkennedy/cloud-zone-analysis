module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0f7719e8b7ba25c61"
  region = "ap-southeast-1"
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
