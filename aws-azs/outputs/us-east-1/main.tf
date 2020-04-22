module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-085925f297f89fce1"
  region = "us-east-1"
}
