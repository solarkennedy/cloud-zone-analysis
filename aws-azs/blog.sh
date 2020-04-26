#!/bin/bash

function header() {
echo '
| Region         | Notes | Map |
|----------------|-------|-----|
'
}


function print_image() {
 echo -n  "<a href=\"/uploads/cloud_analysis/$1.gv.svg\"><img src=\"/uploads/cloud_analysis/$1.gv.svg\" height=\"200\" border=1></a>"
}

function body() {
for region in $(cat region-list); do
  echo -n "| \`$region\` <br> $(region_to_human_name $region) "
  echo -n "| - | "
  print_image $region
  echo " |"
done
}


function region_to_human_name() {
echo '
us-east-2,US East (Ohio)
us-east-1,US East (N. Virginia)
us-west-1,US West (N. California)
us-west-2,US West (Oregon)
ap-east-1,Asia Pacific (Hong Kong)
af-south-1,Africa (Cape Town)
ap-south-1,Asia Pacific (Mumbai)
ap-northeast-3,Asia Pacific (Osaka-Local)
ap-northeast-2,Asia Pacific (Seoul)
ap-southeast-1,Asia Pacific (Singapore)
ap-southeast-2,Asia Pacific (Sydney)
ap-northeast-1,Asia Pacific (Tokyo)
ca-central-1,Canada (Central)
cn-north-1,China (Beijing)
cn-northwest-1,China (Ningxia)
eu-central-1,Europe (Frankfurt)
eu-west-1,Europe (Ireland)
eu-west-2,Europe (London)
eu-west-3,Europe (Paris)
eu-north-1,Europe (Stockholm)
me-south-1,Middle East (Bahrain)
sa-east-1,South America (Sao Paulo)
' | grep $1 | cut -f 2 -d ,
}

function make_table() {
  header
  body
}

make_table
