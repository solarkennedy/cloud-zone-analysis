module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-085925f297f89fce1"
  region = "us-east-1"
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
