module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0f56279347d2fa43e"
  region = "us-west-1"
}
