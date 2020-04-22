module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0701e7be9b2a77600"
  region = "eu-west-1"
}
