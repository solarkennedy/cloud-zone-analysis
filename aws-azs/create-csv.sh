#!/bin/bash
set -eu
region=${PWD##*/}
[[ -f az-list ]] || aws ec2 --region=$region describe-availability-zones | jq -r .AvailabilityZones[].ZoneName | sort > az-list

echo "AZ,$(cat az-list | tr '\n' ',')"
for az in $(cat az-list); do
  IFS="
"
  echo -n "$az,"
  results=$(grep rtt from_$az.txt)
  for result in $results; do
    latency=$(echo $result | cut -c 24-28)
    echo -n "$latency,"
  done
  echo
done
