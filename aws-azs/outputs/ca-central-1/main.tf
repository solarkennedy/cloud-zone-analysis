module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0edd51cc29813e254"
  region = "ca-central-1"
}
