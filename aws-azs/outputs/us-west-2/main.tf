module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-003634241a8fcdec0"
  region = "us-west-2"
}
