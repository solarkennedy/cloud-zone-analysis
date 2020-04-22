#!/bin/bash
for region in $*; do

  echo $region
  ami=$(grep $region ami-list | cut -f 2 -d ,)

  cat << EOF  > outputs/$region/main.tf
module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "$ami"
  region = "$region"
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
EOF

  
done
