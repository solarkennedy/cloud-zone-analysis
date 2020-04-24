module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-00edfb46b107f643c"
  region = "ap-northeast-2"
  instance_type = "t3.nano"
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
