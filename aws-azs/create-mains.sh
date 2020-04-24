#!/bin/bash
for region in $(cat region-list); do

  echo $region
  ami=$(grep $region ami-list | cut -f 2 -d ,)

  if [[ -f outputs/$region/main.tf ]]; then
    continue
  fi

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
