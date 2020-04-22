module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0e342d72b12109f91"
  region = "eu-central-1"
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
