module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0914f03407aa25fb8"
  region = "af-south-1"
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
