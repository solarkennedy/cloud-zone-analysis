module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-077d5d3682940b34a"
  region = "sa-east-1"
}
