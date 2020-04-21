#!/bin/bash
for public_ip in $(jq -r .public_ips.value[] terraform/output.json); do
  az=$(ssh ubuntu@$public_ip -- curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
  echo "# From $public_ip in $az" | tee -a from_$az.txt
  for private_ip in $(jq -r .private_ips.value[] terraform/output.json); do
    echo "ping from $public_ip to $private_ip"
    ssh ubuntu@$public_ip -- ping -c 10 $private_ip | tee -a from_$az.txt
  done
done
