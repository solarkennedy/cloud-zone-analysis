module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-08c757228751c5335"
  region = "eu-west-3"
}
