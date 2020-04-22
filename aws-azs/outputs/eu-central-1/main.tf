module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0e342d72b12109f91"
  region = "eu-central-1"
}
