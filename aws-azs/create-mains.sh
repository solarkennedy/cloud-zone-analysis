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
EOF

  
done
