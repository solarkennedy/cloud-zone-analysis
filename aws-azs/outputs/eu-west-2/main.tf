module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0eb89db7593b5d434"
  region = "eu-west-2"
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
