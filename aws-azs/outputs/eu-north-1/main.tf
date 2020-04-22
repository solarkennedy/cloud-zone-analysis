module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-050981837962d44ac"
  region = "eu-north-1"
}
