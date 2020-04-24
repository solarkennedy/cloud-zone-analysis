region-list:
	aws ec2 describe-regions  | jq -r .Regions[].RegionName | grep -v ap-northeast-1> $@

REGIONS := $(shell cat region-list)

ami-list:
	curl https://cloud-images.ubuntu.com/locator/ec2/releasesTable | grep '18.04 LTS' | grep amd64 | grep hvm:ebs-ssd | cut -f 2,16 -d '"' | sed 's/"/,/g' | sed 's/>//g' | sed 's|</a||g' > ami-list

.PHONY: mains
mains:
	./create-mains.sh $(REGIONS)

init:
	./do-each-region terraform init

plan:
	./do-each-region terraform plan 

apply:
	./do-each-region terraform apply -auto-approve

output:
	./do-each-region 'terraform output -json > output.json'

ping:
	./do-each-region ../../ping-everything.sh

destroy:
	./do-each-region terraform destroy -auto-approve
