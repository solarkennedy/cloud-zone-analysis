module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-07c1207a9d40bc3bd"
  region = "us-east-2"
}
