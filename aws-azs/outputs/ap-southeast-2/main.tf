module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-04fcc97b5f6edcd89"
  region = "ap-southeast-2"
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
