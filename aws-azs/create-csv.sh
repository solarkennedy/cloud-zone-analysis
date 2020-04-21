#!/bin/bash
set -eu

echo "AZ,us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e,us-east-1f"
for az in us-east-1a us-east-1b us-east-1c us-east-1d us-east-1e us-east-1f; do
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
